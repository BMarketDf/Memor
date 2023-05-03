// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

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
        // body: StreamBuilder(
        //     stream:,
        //     builder: (context, snapshot) =>
        body: Center(
            child: SizedBox(
                height: double.infinity,
                child: checkInternetConnection() == false
                    ? const Text("non conection ")
                    : const Text(
                        "Note",
                        style: TextStyle(fontSize: 60),
                      ))));
    //);
  }
}
