// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/page/sercheSetfulwidget.dart';

import '../modls/inf_Srvice_M.dart';
import '../modls/srvise/firbase_Servse_to_Hom.dart';
 //هذا الكلاس نتاع سيرش ولفونكسيوا نتاعوا راني دايرهم وحدهم فيكلاس ساتفول ويدجت وستعملة باش نخدم باساتستيت 
//وهذا هو لكلاس نتاعوا  page/sercheSetfulwidget.dart';
class Serche extends SearchDelegate{
  String ?IsSlected="All";
   String SlectService="تاريخ النشر";
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
    return serchedelog(Typeserche: false,SlectService:SlectService,query:query ,);
         }
  @override
  Widget buildSuggestions(BuildContext context) {
    return serchedelog(IsSlected:IsSlected,Typeserche: true,);
    // Home(IsSlected: IsSlected,);
  }}