// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class Creat extends StatefulWidget {
  const Creat({super.key});

  @override
  State<Creat> createState() => _CreatState();
}

class _CreatState extends State<Creat> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/Backg.png"))),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
         
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 240),
                  child: Text(
                    "Create account",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/gmail.png"))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xF4f4f4f4)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      child: Text(
                        "Sign with gmail",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/facebook.png"))),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xF4f4f4f4)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 43, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      child: Text(
                        "Sign with facebook",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/mail.png"))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.pushNamed(context, '/Sing');},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xF4f4f4f4)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 70, vertical: 15)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                        ),
                        child: Text(
                          "Sign with mail",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " have account !",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 190,
                      height: 40,
                      child: ElevatedButton(
                         style: OutlinedButton.styleFrom(
                    elevation: 0,
                   
                    backgroundColor: Colors.transparent,
                  ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Creat');
                        },
                     
                        child: Text(
                          "Log In ",
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
