import 'package:flutter/material.dart';
import 'package:flutter_app1/mainscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(
              primaryColor: Color(0xff191e3b),
              backgroundColor: Color(0xff191e3b),
              brightness: Brightness.dark,
              errorColor: Color(0xffB00020),
              accentColor: Color(0xff40C4FF),
              ),
      home: MainScreen(),
    );
  }
}

