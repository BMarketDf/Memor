// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:newproject/modls/srvise/firbase_Servse_to_Hom.dart';
import 'dart:io';

import 'package:newproject/modls/srvise/user_serviceFirbase.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(
            child: ElevatedButton(onPressed: (){ HomeModlefirbase().getMoyneRatings("+213656656969");
            
            }, child: Text("Test")
            
            )));
                            
            
    }}
