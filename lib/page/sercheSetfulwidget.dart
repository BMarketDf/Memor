// // ignore_for_file: void_checks

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// import '../modls/srvise/firbase_Servse_to_Hom.dart';

// class serchedelog extends StatefulWidget {
//         String ? SlectService;
//         String ? query;
//         bool Typeserche;
//    serchedelog({super.key,this.SlectService,required this.Typeserche,this.query,});
//   @override
//   State<serchedelog> createState() => _Serche();
// }
//  class _Serche extends State<serchedelog> {
//  HomeModlefirbase serche=HomeModlefirbase();
//       String  IsSlected="All";
//       String IsSlectedServis="تاريخ النشر";
//   List<String> Listselcted=["Users","Service","All"];
//   List<String> Listeserchservice=["تاريخ النشر","الاكثر تقييما","الاكثر تفاعلا"];
//   //fonction get slected 
//    propse(String ?slected){ 
//     //هذه الدالة نتاع يخير وش حاب يريشارشي نتاع سرفيس ولا المستخدم ومزال نقصتها خدما 
//      return ListView.builder(
//        itemCount: Listselcted.length,
//       scrollDirection: Axis.horizontal,
//       itemBuilder:(context, index) { 
//       return SizedBox(
//        width: 200,
//        height: 200,
//         child: RadioListTile(
//            title:Text(Listselcted[index]),
//           value:Listselcted[index], groupValue:IsSlected ,
//           onChanged: (val){
//           setState(() {
//             IsSlected=val!;
//             slected=Listselcted[index];
//             print(Listselcted[index]);
//             print("//////////============/////////////");
//              print(IsSlected);
//          });
//          }),
//       );});
       
//   }
//   // getslected(){
// //  switch (widget.SlectService) {
//     //  case "مستخدمين":
//   //  getUsers();
//   //  break;
// //  case "الكل":
//   // getUsers();
// //  getservis();
// //  break;
// // default:
// // getservis();
// //  }
//   // }
//   Widget getUsers(){
//    //بحث ب الخدمات 
//   return  FutureBuilder(
//       future:serche.getSearcheUser(widget.query!),
//         builder: (context, snapshot) {
//             if(!snapshot.hasData){
//               return const Center(child:CircularProgressIndicator() ,);
//             }else{
//               if (snapshot.data!.isEmpty) {
//                  return Center(child:Text("لايوجدمستخدمين باسم  ${widget.query}"));
//               }
//                return  Expanded(
//                  child: ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index){
//                        return InkWell(
//                         onTap: (){
//                         },
//                          child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0*0.75),
//                            child: Row(children:[
//                             CircleAvatar(
//                               radius: 25,
//                               child: CachedNetworkImage(
//                                imageUrl: snapshot.data![index].imgeurl.toString(),
//                                errorWidget: (context, url, error) => const Icon(Icons.person,color: Colors.blue,),
//                                placeholder:(context,url)=> const Icon(Icons.person,color:Colors.blue),
//                                  imageBuilder: (context, imageProvider) =>
//                                 Image(image: imageProvider,
//                                  fit: BoxFit.scaleDown, ),
//                                                       ),),
//                               const SizedBox(width: 20,),
//                             Text("${snapshot.data![index].Username}",style:const TextStyle(fontWeight: FontWeight.bold)),
//                            ],),),);},),
//                );} },); 
//     }
//    Widget getservis(){
//     //بحث ب الخدمات 
//    return  Column(
//      children: [
//       Expanded(
//         child: SizedBox(
//           child: ListView.builder(
//            itemCount: Listeserchservice.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder:(context, index) { 
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(children: [Text(Listeserchservice[index]),
//                 Radio(value:Listeserchservice[index], groupValue:IsSlectedServis , onChanged: (val){
//                   setState(() {       
//                      IsSlectedServis=val!; }); })],),],);}),
//         ),),
//         FutureBuilder(
//          future:serche.getSearche(widget.query!,IsSlectedServis),
//           builder: (context, snapshot) {
//               if(!snapshot.hasData){
//                 return const Center(child:CircularProgressIndicator(),);
//               }else{
//                 if (snapshot.data!.isEmpty) {
//                    return Center(child: Text("لايوجد خدمات  ${widget.query}"));
//                 }
//                  return  Expanded(
//                    child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index){
//                          return InkWell(
//                           onTap: (){
//                           },
//                            child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0*0.75),
//                              child: Column(children:[
//                               CachedNetworkImage(
//                                imageUrl: snapshot.data![index].imgUrl.toString(),
//                                errorWidget: (context, url, error) => const Icon(Icons.person,color: Colors.blue,),
//                                placeholder:(context,url)=> const Icon(Icons.person,color:Colors.blue),
//                                  imageBuilder: (context, imageProvider) =>
                               
//                                 Image(image: imageProvider,
//                                  fit: BoxFit.scaleDown, ),
//                             ),
//                               const SizedBox(width: 25,),
//                                 Text("${snapshot.data![index].title}",style: const TextStyle(fontSize:17,
//                              fontWeight:FontWeight.w600),),
//                              Text("Raitin ${snapshot.data[index].Raitin}"),
//                              Text("Count ${snapshot.data[index].Count}"),
//                              Text("date ${snapshot.data[index].createDate}")
                             
//                              ],),),);},),
//                  );} },), 
//     ],); 
//      }
//   @override
//   Widget build(BuildContext context) {
//     if (widget.Typeserche) 
//     {//momken ytbdel hda vareaible youli int 
//      print("=================================================");
//  print(IsSlected);
//  print("===============================================================");
//        return propse(IsSlected);
//     }
//      else{
//       if(IsSlected=="Users"){
//          return getUsers();
//       }
//       else{
       
       
       
//       return getservis();
//       }
//      }
//      }
// }