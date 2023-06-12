// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newproject/cheker_internat_connection.dart';
// import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/page/sercheSetfulwidget.dart';

import '../modls/inf_Srvice_M.dart';
import '../modls/srvise/firbase_Servse_to_Hom.dart';
 //هذا الكلاس نتاع سيرش ولفونكسيوا نتاعوا راني دايرهم وحدهم فيكلاس ساتفول ويدجت وستعملة باش نخدم باساتستيت 
//وهذا هو لكلاس نتاعوا  page/sercheSetfulwidget.dart';
class Serche extends SearchDelegate{
     List<String> Listselcted=["المستخدمين","خدمات","الكل"];
    String ?IsSlected="الكل ";
    HomeModlefirbase serche=HomeModlefirbase();
    String IsSlectedServis="تاريخ النشر";
    List<String> Listeserchservice=["تاريخ النشر","الاكثر تقييما","الاكثر تفاعلا",];

   
Widget getServises(){
 //بحث ب الخدمات 
return  Column(
  children: [
   SlectTypeService(),   
     FutureBuilder(
    
        future:serche.getSearche(query,IsSlectedServis),
    
          builder: (context, snapshot) {
    
              if(!snapshot.hasData){
    
                return const Center(child:CircularProgressIndicator() ,);
    
              }else{
    
                if (snapshot.data!.isEmpty) {
    
                   return Center(child:Text("لايوجد خدمات باسم  $query"));
                }    
                 return  Expanded(    
                   child: ListView.builder(
    
                    itemCount: snapshot.data!.length,
    
                    // scrollDirection: Axis.horizontal,
    
                    itemBuilder: (context, index){
    
                         return InkWell(
    
                          onTap: (){
    
                          },
    
                       child: Padding(
    
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0*0.75),
    
       child: Column(children:[
    
        CachedNetworkImage(
    
         imageUrl: snapshot.data![index].imgUrl.toString(),
    
         errorWidget: (context, url, error) => const Icon(Icons.person,color: Colors.blue,),
    
         placeholder:(context,url)=> const Icon(Icons.person,color:Colors.blue),
    
           imageBuilder: (context, imageProvider) =>
    
         
    
          Image(image: imageProvider,
    
           fit: BoxFit.scaleDown, ),
    
      ),
    
        const SizedBox(width: 25,),
    
          Text("${snapshot.data![index].title}",style: const TextStyle(fontSize:17,
    
       fontWeight:FontWeight.w600),),
    
       Text("Raitin ${snapshot.data[index].Raitin}"),
    
       Text("Count ${snapshot.data[index].Count}"),
    
       Text("date ${snapshot.data[index].createDate}")

       ],),),);},),
    
                 );} },),
  ],
); 
  }

    Widget getUsers(){
 //بحث ب الخدمات 
return  FutureBuilder(
    future:serche.getSearcheUser(query),
      builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(child:CircularProgressIndicator() ,);
          }else{
            if (snapshot.data!.isEmpty) {
               return Center(child:Text("لايوجدمستخدمين باسم  $query"));
            }
             return  Expanded(
               child: ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: (IsSlected=="المستخدمين")? Axis.vertical:Axis.horizontal,
                itemBuilder: (context, index){
                     return Container(
                      height: 1,
                       child: InkWell(
                        onTap: (){
                        },
                         child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0*0.75),
                           child: Row(children:[
                            CircleAvatar(
                              radius: 25,
                              child: CachedNetworkImage(
                               imageUrl: snapshot.data![index].imgeurl.toString(),
                               errorWidget: (context, url, error) => const Icon(Icons.person,color: Colors.blue,),
                               placeholder:(context,url)=> const Icon(Icons.person,color:Colors.blue),
                                 imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider,
                                 fit: BoxFit.scaleDown, ),
                                                      ),),
                              const SizedBox(width: 20,),
                            Text("${snapshot.data![index].Username}",style:const TextStyle(fontWeight: FontWeight.bold)),
                           ],),),),
                     );},),
             );} },); 
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      query="";
    }, icon:const  Icon(Icons.clear))];
   }
  @override
  Widget? buildLeading(BuildContext context) {
        return IconButton(onPressed: (){
         close(context,null);
        }, icon:const  Icon(Icons.arrow_back));}
    @override
   Widget buildResults(BuildContext context) {
      if(query.isEmpty){
        return const Center(child: Text("الرجاء ادخل قيمةgg البحث  "),);
      }else{
         if (IsSlected=="المستخدمين") {
             return getUsers(); 
         } else {         if (IsSlected=="خدمات") {
                   return  getServises();
         }else{

          return ListView(children: [
                  getServises(),
                  const SizedBox(height: 150,),
                   SizedBox(
                    height: 550,
                    child: getUsers()),
           ],);
         }
         }
      }
        }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        itemCount:Listselcted.length ,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index){   
          return SizedBox(
            // height: 200,
            width: 200,
            child: Padding(
  padding: const EdgeInsets.only(left: 7.0,top: 7.0),
  child: ElevatedButton(onPressed: (){
   IsSlected=Listselcted[index];
  }, child:  Center(child: Text(Listselcted[index]),),
  //  style:  ButtonStyle(),
  ),
),);}  ),   );
  }
Widget SlectTypeService(){

return SizedBox(
  height: 40,
child: ListView.builder(
  itemCount: Listeserchservice.length,
  scrollDirection: Axis.horizontal,
  itemBuilder: 
(context, index) {
  return Container(
 height:200,
 width:150,
 child:
   Padding(
     padding: const EdgeInsets.only(left: 7.0,top: 7.0),
     child: ElevatedButton(onPressed: (){
      IsSlectedServis=Listeserchservice[index];
     }, child:  Center(child: Text(Listeserchservice[index]),),
     //  style:  ButtonStyle(),
     ),
   ),
      
   );
})
   );
     }
  }