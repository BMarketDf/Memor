// ignore_for_file: non_constant_identifier_names

class Users {
  String? uid;
  String? password;
  // ignore: non_constant_identifier_names
  String? Date;
  String? address;
  String? phone;
  String? email;
  String? Srvice;
  String? Username;
  String? imgeurl;
  //creat constracter
  Users(
      {this.uid,
      this.password,
      this.Date,
      this.address,
      this.phone,
      this.Srvice,
      this.email,
      this.Username,
      this.imgeurl});
  //convart json to map dart
  Users.fromjson(Map<String, dynamic> json) {
    uid = json["uid"];
    Date = json["Date"];
    address = json["address"];
    phone = json["phone"];
    Srvice = json["Service"];
    Username = json["Username"];
    imgeurl = json["imgeurl"];
  }
  //convert  map dart tojson
  Map<String, dynamic> tojson() {
    return {
      "uid": uid,
      "Date": Date,
      "address": address,
      "phone": phone,
      "Srvice": Srvice,
      "Username": Username,
      "imgeurl": imgeurl,
    };
  }
}
class Userviwemodle {
  Users? User;
  Userviwemodle({this.User});
  get uid => User?.uid;
  get Date => User?.Date;
  get address => User?.address;
  get phone => User?.phone;
  get Srvice => User?.Srvice;
  get email => User?.email;
  get Username => User?.Username;
  get imgeurl => User?.imgeurl;
}
