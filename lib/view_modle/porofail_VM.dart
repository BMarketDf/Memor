import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproject/modls/srvise/user_serviceFirbase.dart';
import '../modls/Repostre_Apstract/abstract_user.dart';
import '../modls/inf_User_M.dart';

class profaile_vm extends ChangeNotifier {
  abstractuser? Abstractuser;
  profaile_vm({this.Abstractuser});
  Users? uesr;
  //  fonction  profaile user
  Future<Userviwemodle?> getpe(String uid) async {
    uesr = await Abstractuser!.getprophaile(uid);
    notifyListeners();
    if (uesr != null) {
      return Userviwemodle(User: uesr);
    }
  }
}
