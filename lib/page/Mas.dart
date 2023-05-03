import 'package:flutter/material.dart';

class Mas extends StatefulWidget {
  const Mas({super.key});

  @override
  State<Mas> createState() => _MasState();
}

class _MasState extends State<Mas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Massge',
          style: TextStyle( fontSize: 26),
        )),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
