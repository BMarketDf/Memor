// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pic1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 550),
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Expand your business',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Find more clients',
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pic2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 550),
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Show your business',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          'Let everyone see your work',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pic3.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 550),
                      height: 80,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Join us',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.amber[300],
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/LogIn');
                              },
                              child: Text(
                                'Log In ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            width: 150.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.amber[300],
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Sing');
                              },
                              child: Text(
                                'Sing In  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
