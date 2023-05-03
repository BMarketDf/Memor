import 'package:newproject/modls/inf_User_M.dart';

import '../modls/Repostre_Apstract/abstract_user.dart';
import '../modls/srvise/user_serviceFirbase.dart';

class AddUser {
  abstractuser? Abstrctuser;
  AddUser({this.Abstrctuser});
  Future Adduser(String Email, String password, Users Data, context) async {
    await Abstrctuser!
        .signupWhtEmailAndPassword(Email, password, Data, context);
  }

  Future loginuser(String email, String password, Context) async {
    Abstrctuser!.Loginuser(email, password, Context);
  }
}
