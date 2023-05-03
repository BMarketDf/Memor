import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveIcon extends StatefulWidget {
  @override
  _SaveIconState createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Icon(
        Icons.bookmark,
        size: 35,
        color: _isPressed ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
