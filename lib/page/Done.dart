// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/Backg.png"))),
      child: Scaffold(
        body: Container(height: double.infinity,
          width: double.infinity,
          
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 17,top:220),
                      child: Text("Registration completed ",
                      style: TextStyle( fontSize: 34,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 32),
                      child: Text(" successfully",
                      style: TextStyle( fontSize: 34,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 200,top:25),
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(image: AssetImage("assets/done.png"))
                      ),
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Text("Back and" ,
                  
                 style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                    Container(width: 190,
                    height: 40,
                    
                    child: ElevatedButton(
                       style: OutlinedButton.styleFrom(
                    elevation: 0,
                   
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.yellow[600],
                        fontWeight: FontWeight.w700),
                  ),
                ),
                    
                    decoration: BoxDecoration(color: Colors.transparent),)
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