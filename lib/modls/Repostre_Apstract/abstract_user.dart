import 'package:flutter/material.dart';
import 'package:newproject/modls/inf_Reviews_M.dart';

import '../inf_Srvice_M.dart';
import '../inf_User_M.dart';

abstract class abstractuser {
  Future signupWhtEmailAndPassword(    String Email, String password, Users addusr, context);
  Future rsetpassword(email, context);
  Future Loginuser(String email, String password, context);
  Future signout();
  Future<Users?> getprophaile(String uid);
  // add viwes model  le tous fonction 
  Future<bool>addReviews(Reviews infReviews);
  Future<bool> deleteReviews(String id,String idservice);
  Future<bool> UpdateReviews(String id ,Reviews updaetReviwes);
  Future addSrvice(Srvices infSrvice);///تصليح  الخطا في context 
  Future<bool>deleteService(String id );
  Future<bool>UpdaetService(Srvices srvices );


}
