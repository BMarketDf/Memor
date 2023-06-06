import 'package:flutter/material.dart';

class cathe {
  errer(context, e, typ) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(typ),
              content: Text(e.toString()),
            ));
  }

  cercoularindecatercenter(context) {
    showDialog(
        context: context,
        builder: (context) => const  AlertDialog(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
