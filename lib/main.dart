import 'package:flutter/material.dart';
import 'package:ungtour/screens/authen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}


