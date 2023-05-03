import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:newproject/modls/Repostre_Apstract/abstract_user.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';
import 'package:newproject/modls/inf_Srvice_M.dart';

import '../../CatchErer.dart';
import '../inf_User_M.dart';

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
      infSrvice.Id=rsponce!.id;
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
                 DocumentReference  Updaet= await Instencefirbsefirstor.collection("Services").doc(service.Id);
                Updaet.update(service.tojson());
                                  ret=true;
      } catch (e) {
       return false ;
      }
      return ret;

  }


}
