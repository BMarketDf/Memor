import 'dart:developer';

import 'package:get/get.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_Servse_to_Homfirbase.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newproject/modls/inf_Ratings_M.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';
import 'package:newproject/modls/inf_User_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';

import '../inf_Srvice_M.dart';

class HomeModlefirbase extends abstractHome {
  List<Srvices> dataservce = [];
  List<Reviews> dataReviews = [];
  final constent = FirebaseFirestore.instance;
  @override
  Future<List<Srvices>> getAllService() async {
    await constent.collection("Services").get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        dataservce.add(Srvices.fromjson(value.docs[i].data()));
      }
    });

    return dataservce;
  }
  //get all  Reviews in service 
  @override
  Future<List<Reviews>?> getAllReviews(String idservice) async {
try {
  
      await constent.collection("Services").doc(idservice).collection("Reviews").get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        dataReviews.add(Reviews.fromjesion(value.docs[i].data()));
      }
    });
} catch (e) {}
    return dataReviews;
  }
    
  @override
  Future<double> getMoyneRatings(String userid) async {
  double Moyne=0;
   List<DocumentSnapshot> doc=[];
         double toutaleRating=0;
 try {
    await constent.collection("Ratings").where("userid",isEqualTo: userid).get().then((QuerySnapshot MoyanRating) {
  doc=MoyanRating.docs;
      for (var i = 0; i < doc.length; i++) {
       toutaleRating=toutaleRating+ doc[i]['Rating'];
      }
 });

  if (doc.isNotEmpty) {
         Moyne=toutaleRating/doc.length;
         print(Moyne);
}
 } catch (e) {
   
 }
      return Moyne;  
  }
  
  
  @override
  // ignore: non_constant_identifier_names
 Future getSearche(String query,String isSlected) async {
  List<Srvices> resultSearch = [];
  try {
   QuerySnapshot<Map<String, dynamic>> resoult ; 
     if(query.isNotEmpty){
      switch (isSlected) {
        case "الاكثر تقييما":
         resoult= await constent.collection("Services").orderBy("Raitin",descending: true).get();
          break;
          case "الاكثر تفاعلا":               
            resoult= await constent.collection("Services").orderBy("Count",descending:true).get();
          break;
        default:
      resoult= await constent.collection("Services").get();
      } 
          for (int element=0; element<resoult.docs.length;element++) {
              if (resoult.docs[element].data()["description"].toString().toLowerCase().contains(query.toLowerCase())
              || resoult.docs[element].data()["title"].toString().toLowerCase().contains(query.toLowerCase())) 
              {
                 resultSearch.add(Srvices.fromjson(resoult.docs[element].data()));
               }
              }
              
             if(isSlected=="تاريخ النشر"){
             resultSearch.sort((a, b) => b.createDate!.compareTo(a.createDate!));  
             }
             }
        return resultSearch;
  }on  FirebaseException catch (e) {
    print(e);
  }
}

  @override
  Future getSearcheUser(String qure)async  {
     List<Users> resultSearch = [];
  try {
       await constent.collection("Users").get().then((value){
        for (int element=0; element<value.docs.length;element++) {
              if (value.docs[element].data()["Username"].toString().toLowerCase().contains(qure.toLowerCase())
              || value.docs[element].data()["email"].toString().toLowerCase().contains(qure.toLowerCase())
              ) {
                 resultSearch.add(Users.fromjson(value.docs[element].data()));
             }}
                });
        return resultSearch;
  }on  FirebaseException catch (e) {
    print(e);
  }

  }

    

}