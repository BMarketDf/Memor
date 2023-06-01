import 'package:newproject/modls/Repostre_Apstract/abstract_Servse_to_Homfirbase.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newproject/modls/inf_Ratings_M.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';
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


  if (doc.length!=0) {
         Moyne=toutaleRating/doc.length;
         print(Moyne);
}
 } catch (e) {
   
 }
      return Moyne;  
  }
  
  @override
  Future getMasseg(String id)async  {
       List massegs=[];
try{
// int length= await constent.collection("Users").doc(id).collection("Massegs").snapshots().length;
//     m.forEach((element) { 
//                  print("dddddddd");
//        for (var element in element.docs) {
//          massegs.add(Massegs.fromjson(element.data()));

//        }
//     });
  
  }
catch (e) {}

  }}

