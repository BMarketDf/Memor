import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            size: 35,
            color: _isPressed ? Colors.red : Colors.grey,
          ),
          Text(
            "  0",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
