import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../modls/srvise/firbase_Servse_to_Hom.dart';

class serchedelog extends StatefulWidget {
        String ?IsSlected;
        String ? SlectService;
        String ? query;
        bool Typeserche;
   serchedelog({super.key,this.SlectService,this.IsSlected,required this.Typeserche,this.query,});
  @override
  State<serchedelog> createState() => _Serche();
}
 class _Serche extends State<serchedelog> {
 HomeModlefirbase serche=HomeModlefirbase();
  List<String> Listselcted=["Users","Service","All"];
  List<String> Tupeserchservice=["تاريخ النشر","الاكثر تقييما","الاكثر تفاعلا"];
  // Widget getsearchorderby(String IsSlected2){
  //  return ListView.builder(
  //      itemCount: Listselcted2.length,
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder:(context, index) { 
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children:[  Row(children: [Text("${Listselcted2[index]}"),
  //         Radio(value:Listselcted2[index], groupValue:widget.IsSlected , onChanged: (val){
  //           setState(() {
  //              widget.IsSlected=val;
  //              print(widget.IsSlected);
  //           }); })],),]); });
  // }
  //fonction get slected 
  Widget getslected(){
    //هذه الدالة نتاع يخير وش حاب يريشارشي نتاع سرفيس ولا المستخدم ومزال نقصتها خدما 
     return ListView.builder(
       itemCount: Listselcted.length,
      scrollDirection: Axis.horizontal,
      itemBuilder:(context, index) { 
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[ 
           Row(children: [Text("${Listselcted[index]}"),
          Radio(value:Listselcted[index], groupValue:widget.IsSlected , onChanged: (val){
            setState(() {
               widget.IsSlected=val!;
            });})],), ]);});
  }
   Widget getservis(){
    //بحث ب الخدمات 
   return  Column(
     children: [
      Expanded(
        child: ListView.builder(
         itemCount: Tupeserchservice.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) { 
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [Text("${Tupeserchservice[index]}"),
              Radio(value:Tupeserchservice[index], groupValue:widget.IsSlected , onChanged: (val){
                setState(() {
                   widget.SlectService=val!;
                   print(widget.SlectService);
                   print("////////////");//هنا راني داير سات  ستيت بصح مخدمتش الخدمة نتعها 
                   print(val);
                }); 
                }) ], ),
          ],
        ); }),
      ),
    FutureBuilder(
         future:serche.getSearche(widget.query!,widget.SlectService!),
          builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Center(child:CircularProgressIndicator() ,);
              }else{
                if (snapshot.data!.isEmpty) {
                   return Center(child: Text("لاتوجد نتائج ب ${widget.query}"));
                }
                 return  Expanded(
                   child: ListView.builder(
                    itemCount: snapshot.data!.length,
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
    ],); 
     }
  @override
  Widget build(BuildContext context) {
    if (widget.Typeserche) {//momken ytbdel hda vareaible youli int 
      return getslected();
    }else{
      ChangeNotifier(); /// fonction update data 
      return getservis();

    }
     }
}