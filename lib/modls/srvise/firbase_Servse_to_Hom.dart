import 'package:newproject/modls/Repostre_Apstract/abstract_Servse_to_Homfirbase.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';

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
  
      await constent.collection("Services").doc(idservice).collection("Reviews").get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        dataReviews.add(Reviews.fromjesion(value.docs[i].data()));
      }
    });
    return dataReviews;
  }
  @override
  Future getAllRatings(String userid) async {
    
    
  }
}


