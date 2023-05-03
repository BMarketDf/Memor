import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'icons/HeartIcon.dart';
import 'icons/SaveIcon.dart';

class Dommend extends StatefulWidget {
  const Dommend({super.key});

  @override
  State<Dommend> createState() => _DommendState();
}

int _rating = 0;

class _DommendState extends State<Dommend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child:Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:10 , bottom : 10),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Center(
                child: Text(
                  ' My work ',
                  style: TextStyle(fontSize: 25 ,
                  fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: ' Enter A Message Her',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18)))),
                  ),
                ),
                Container(
              margin: EdgeInsets.only(top:10 , bottom : 10),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Center(
                child: Text(
                  ' worker',
                  style: TextStyle(fontSize: 25 ,
                  fontWeight: FontWeight.bold),
                ),
              ),
            ),
                 Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                child: Row(
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
                              "bachir ben",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          padding: EdgeInsets.only(top: 15),
                          child: Center(
                              child: Text(
                            "@mohe424",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        )
                      ]),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      backgroundImage: AssetImage('assets/person.jpg'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color:Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    

                    Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _rating = 1),
                child: Column(
                  children: [
                    Icon(Icons.star,
                        color: _rating >= 1 ? Colors.yellow : Colors.grey),
                  ],

                ),
                    
              ),
              GestureDetector(
                onTap: () => setState(() => _rating = 2),
                child: Icon(Icons.star,
                    color: _rating >= 2 ? Colors.yellow : Colors.grey),
              ),
              GestureDetector(
                onTap: () => setState(() => _rating = 3),
                child: Icon(Icons.star,
                    color: _rating >= 3 ? Colors.yellow : Colors.grey),
              ),
              GestureDetector(
                onTap: () => setState(() => _rating = 4),
                child: Icon(Icons.star,
                    color: _rating >= 4 ? Colors.yellow : Colors.grey),
              ),
              GestureDetector(
                onTap: () => setState(() => _rating = 5),
                child: Icon(Icons.star,
                    color: _rating >= 5 ? Colors.yellow : Colors.grey),
              ),
            ],
          ),
          Text("Rating" ,
                    style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
        
   Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(color:Colors.transparent),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SaveIcon(),
 SizedBox(width: 15,),
        HeartIcon(),
        SizedBox( width: 15,),
         Container(
  width: 150.0,
  height: 50.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.amber,
  ),
  child: TextButton(
    onPressed: () {},
    child: Text(
      'Service Request',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
),


      ],
    ),
   ),

          ],
        )
        ),
      )
    );
  }
}
