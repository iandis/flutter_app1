import 'package:flutter/material.dart';
import 'package:flutter_app1/loginscreen.dart';

var mont100 = TextStyle(
  fontWeight: FontWeight.w100,
);
var mont200 = TextStyle(
  fontWeight: FontWeight.w200,
);
var mont300 = TextStyle(
  fontWeight: FontWeight.w300,
);
var mont500 = TextStyle(
  fontWeight: FontWeight.w500,
);
var mont600 = TextStyle(
  fontWeight: FontWeight.w600,
);
var mont700 = TextStyle(
  fontWeight: FontWeight.w700,
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
              primaryColor: Color(0xff191e3b),
              backgroundColor: Color(0xff191e3b),
              brightness: Brightness.dark,
              errorColor: Color(0xffB00020),
              accentColor: Color(0xff40C4FF),
              fontFamily: "Montserrat",
      ),
      home: Login(),
    );
  }
}

