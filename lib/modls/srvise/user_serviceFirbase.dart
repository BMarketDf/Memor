// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';
import 'package:newproject/modls/inf_Srvice_M.dart';
import 'package:newproject/modls/inf_massegs_M.dart';
import 'package:newproject/page/masseg.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../CatchErer.dart';
import '../inf_User_M.dart';
import '../inf_order_M.dart';
import '../inf_Ratings_M.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

class Auth extends abstractuser {
  List<Users> myusers = [];
  Users myuser = Users();
       DocumentReference? rsponce ;
  final FirebaseAuth FirebaseA = FirebaseAuth.instance;
        var Instencefirbsefirstor=  FirebaseFirestore.instance;

  ///SIGN UP  wht email and passeord
  @override
  Future signupWhtEmailAndPassword(
      String Email, String password, Users addusr, context) async {
    try {
      cathe().cercoularindecatercenter(context);
      await FirebaseA.createUserWithEmailAndPassword(
              email: Email, password: password)
          .then((value) {
        //send dat to fireStor
        addusr.uid = Email;
    Instencefirbsefirstor.collection("Users")
            .doc(addusr.email)
            .set(addusr.tojson());
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/Swit", (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      return cathe().errer(context, e.message, "Errer");
    }
  }

  /*/ methode Add data in firebasefirestor
  Future<String?> sendDatdsignup(Users addusr, context) async {
    try {} on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      return cathe().errer(context, e.message, "Errer");
    }
  }
*/
  //استرجاع  كلمة المرور
  @override
  rsetpassword(email, context) async {
    try {
      await FirebaseA.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      return cathe().errer(context, e.message, "Errer");
    }
  }

  //تسجيل الدخول
  @override
  Loginuser(String email, String password, context) async {
    try {
      cathe().cercoularindecatercenter(context);
      await FirebaseA.signInWithEmailAndPassword(
              email: email, password: password)
          .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
              '/Swit', (Route<dynamic> route) => false));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      return cathe().errer(context, e.message, "Errer");
    }
  }

  //sign out
  @override
  Future signout() async {
    await FirebaseA.signOut();
  }

  //adda service
  @override
  Future<bool> addSrvice(Srvices infSrvice) async {
    bool ref =false;
    try {
      //cathe().cercoularindecatercenter(context);
      rsponce = await Instencefirbsefirstor.collection("Services").doc();
      infSrvice.serviceuid=rsponce!.id;
       rsponce!.set(infSrvice.tojson());
        ref =true; 

      ///  return cathe().errer(context, "", "Conferm");
    } on FirebaseException catch (e) {
      //return cathe().errer(context, e.message, "Errer");
    }
           return ref ;

  }

  /// grt propahle
  @override
  Future<Users?> getprophaile(String uid) async {
    try {
      final user =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      if (user.exists) {
        myuser = Users.fromjson(user.data()!);
      }
    } on FirebaseException catch (e) {}
        return myuser;
  }

  @override
  Future<List<Users>?> getuser(String uid) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection("Users")
          .where("uid", isEqualTo: uid)
          .get();
      if (!user.docs.isEmpty) {
        user.docs.forEach((element) {
          myusers.add(Users.fromjson(element.data()));
        });
      }
    } on FirebaseException catch (e) {}
    return myusers;
  }
  /// add reviwes to service 
  @override
  Future<bool> addReviews(Reviews infReviews)async  {
    bool ref =false ;
         try {
       rsponce =await Instencefirbsefirstor.collection("Services").doc(infReviews.idservice).collection("Reviews").doc();
      infReviews.id= rsponce!.id;
      rsponce!.set(infReviews.tojson());
      ref =true ;

         } catch (e) {ref = false ;}
         return ref ;
  }
  //Updaet Reviwes in Service 
    @override
  Future<bool> UpdateReviews(String id,Reviews updaetReviwes) async {
      bool ret =false ;
      try {
                 DocumentReference  Updaet= await Instencefirbsefirstor.collection("Services").doc(updaetReviwes.idservice).collection("Reviews").doc( id);
                Updaet.update(updaetReviwes.tojson());
                                  ret=true;
      } catch (e) {
        return false;
      }
      return ret;

  }
  ///delete Reviwes 
  @override
  Future<bool>deleteReviews(String id,String idservice)async  {
  bool ret =false ;
     try{
         // ignore: non_constant_identifier_names
         DocumentReference  Delete= await Instencefirbsefirstor.collection("Services").doc(idservice).collection("Reviews").doc( id);
             // ignore: unnecessary_null_comparison
             if(Delete!= null){
              // add wher 
              await Delete.delete();
              ret = true ;
             }else{
              ret  = false ;
             }
            }
     catch(e){return false ;}
     return ret ;
  
  }
//delete Service 
  @override
  Future<bool> deleteService(String id)async  {
     bool ret =false ;
     try{
         DocumentReference Delete= await Instencefirbsefirstor.collection("Services").doc(id);
             if(Delete!= null){
              Delete.delete();
              //add apelle fonction delete Reviews
              ret = true ;
             }else{
              ret  = false ;
             }
     }
     catch(e){return false ;}
     return ret ;
  }
  //Update Service 
  
  @override
  Future<bool> UpdaetService(Srvices service)async { 
   bool ret =false ;
      try {
                 DocumentReference  Updaet= await Instencefirbsefirstor.collection("Services").doc(service.serviceuid);
                Updaet.update(service.tojson());
                                  ret=true;
      } catch (e) {
       return false ;
      }
      return ret;

  }
  // Order by Service in crante user 
  @override
  Future OrderbyService(order newOrder) async {
          try {
         DocumentReference idrefrence= Instencefirbsefirstor.collection("Services").doc(newOrder.userid).collection("Order").doc();
            newOrder.id=idrefrence.id;
           await  idrefrence.set(newOrder.tojson());
          } catch (e) {
                       return e;
          }  
  }
  // khce code vwie Modle 
  @override
  Future reveiousorder(String id,String idservice) async {
    DocumentReference deleteOrder= Instencefirbsefirstor.collection("Services").doc(idservice).collection("Order").doc(id);
    if (deleteOrder!=null) {
      await  deleteOrder.delete();
    }
   }
   //add Rating to user 
   @override
  Future addRating(RatingsM infRating) async {
    DocumentReference addRating = await Instencefirbsefirstor.collection("Users").doc(infRating.userid).collection("Ratings").doc();
       infRating.id= addRating.id;
       await  addRating.set(infRating.json());  
    }
         @override
         Future addMassge(Massegs massegs) async {
           try {
         DocumentReference  Masseg=  Instencefirbsefirstor.collection("Massegs").doc();
        //  DocumentReference  chat=  Instencefirbsefirstor.collection("chat").doc();
        //مزالي كيفاه ينشاء محادثة  
        ////نديرها كي يدير طلب تتنشاء محادثة 
        ////حليا نديرها مانيال  
            massegs.id=Masseg.id;
          
            await Masseg.set(massegs.tojson());
          // ignore: empty_catches
          } catch (e) {
          }
         }  
           @override
           deletMassge(String ?idmasseg) async {
                          bool isdelete=false;
         try {
                var delet =Instencefirbsefirstor.collection("Massegs").doc(idmasseg);
            if(delet!=null){
              await delet.delete();
               isdelete=true;
            }
         } catch (e) {}
           return isdelete;
           }
             @override
             Future deleteimagrinfirestore(String? pathe)async  {
             try {
                  await FirebaseStorage.instance.refFromURL(pathe!).delete().catchError(  (error) => print("+++++++++++++$error"));
              // ignore: empty_catches
          } catch (e) {
           print("non delete imge");
       }
             }
}