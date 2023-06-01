import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Home.dart';
import 'Maps.dart';
import 'Massegs.dart';
import 'Note.dart';
import 'Profile.dart';

class Swit extends StatefulWidget {
  const Swit({super.key});

  @override
  State<Swit> createState() => _SwitState();
}

class _SwitState extends State<Swit> {
  int index = 2 ;
  final screens=[
    Note(),
    Mas(),
    Home(),
    Maps(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final items =<Widget>[
    Icon(Icons.notification_add_rounded , size:30 ,),
    Icon(Icons.mark_email_unread_sharp , size:30 ,),
    Icon(Icons.home , size:30 ,),
    Icon(Icons.location_on_sharp , size:30 ,),
    Icon(Icons.account_box_rounded, size:30 ,),
    ];
    return  Scaffold(
      bottomNavigationBar:CurvedNavigationBar(items: items,
      backgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 300),
      color: Colors.amber,
      height: 50,
      index: index,
      onTap: (index)=> setState(()=>this.index = index ),
      ),
      body: screens[index],
    );
  }
}