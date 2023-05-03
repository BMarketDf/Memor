import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newproject/modls/inf_User_M.dart';
import '../modls/srvise/user_serviceFirbase.dart';
import '../view_modle/porofail_VM.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //viwe profaile in  fireBase classe Auth()
  final currentUser = FirebaseAuth.instance.currentUser;

  var profaile = profaile_vm(Abstractuser: Auth());
  //Userviwemodle? user;
  // Profile profill = Profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text("Confirm Sign Out"),
                        content: const Text("Do you really want sin out ?",
                            textAlign: TextAlign.center),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                child: TextButton(
                                    onPressed: () async {
                                      await Auth().signout();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/LogIn',
                                              (Route<dynamic> route) => false);
                                    },
                                    child: const Text("Yas")),
                              ),
                              Container(
                                width: 100,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("No")),
                              )
                            ],
                          )
                        ],
                      ));
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      // الطا هر راني فالAppBare زدت  تسجيل الخروج مع كونفيرمي
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                //kkkkkkkkkkkkk
                child: FutureBuilder(
                  future: profaile.getpe(currentUser!.email.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      child:
                      return Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 180),
                            height: 90,
                            width: 120,
                            child: Column(children: [
                              Container(
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.only(top: 18),
                                child: Center(
                                  child: Text(
                                    "       ${snapshot.data!.Username}       ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 40,
                                padding: EdgeInsets.only(top: 15),
                                child: Center(
                                    child: Text(
                                  "${snapshot.data!.uid}           ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            ]),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            backgroundImage:
                                NetworkImage("${snapshot.data!.imgeurl}"),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                width: double.infinity,
                height: 40,
                child: Text(
                  "My account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add a service',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'my services',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save list',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              Container(
                padding: EdgeInsets.only(top: 6, left: 20, bottom: 3),
                width: double.infinity,
                height: 40,
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Personal information',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Protection',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                width: double.infinity,
                height: 40,
                child: Text(
                  "Support",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Help',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Send a notification',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(35),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Privacy policy',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 26),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
