import 'package:flutter/material.dart';

class conste {
  snakepare(String masseg ,context){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(masseg)));
  }
  
}