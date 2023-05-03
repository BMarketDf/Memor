import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 59,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 100,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child: ExpansionTile(
              
                title: Text('Jobs',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          ),
          Container(
            margin: EdgeInsets.only(right: 190),
            child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow[400]),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 41, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                    onPressed: () {},
                    child: Text(
                      'Search',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 20 ,top:20),
                height: 450,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/maps.jpeg",
                  
                  
                  ),
                  fit: BoxFit.cover,)
                ),
                  
                ),
          ),
        ],
      ),
    );
  }
}
