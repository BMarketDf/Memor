// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newproject/view_modle/Sign_VM.dart';

import '../modls/srvise/user_serviceFirbase.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isloding = false;
  String email = "";
  String password = "";
  bool? isChecked = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloding == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image:
                      DecorationImage(image: AssetImage("assets/Backg.png"))),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 180),
                        child: Text(
                          "BMARKET",
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 266,
                        height: 50,
                        // Email
                        child: TextFormField(
                          onChanged: (value) => email = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "لا يمكن ان يكون هذا الحقل فارغ ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email ",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30.0,
                              )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xF4f4f4f4),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 266,
                        height: 50,
                        //Password
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (value) => password = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "لا يمكن ان يكون هذا الحقل فارغ ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password ",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 28.0,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility,
                                color: Colors.black,
                                size: 25.0,
                              )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xF4f4f4f4),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 30,
                            margin: EdgeInsets.only(left: 180),
                          ),
                          Checkbox(
                              value: isChecked,
                              activeColor: Colors.amber[300],
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              }),
                          Text(
                            "Remind Me",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            await AddUser(Abstrctuser: Auth())
                                .loginuser(email, password, context);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow[400]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account ?",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: 190,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Creat');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(1)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              child: Text(
                                "Create account ",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.yellow[600],
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            decoration: BoxDecoration(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
