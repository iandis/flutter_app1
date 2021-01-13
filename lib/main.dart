import 'package:flutter/material.dart';
import 'package:flutter_app1/loginscreen.dart';


var mont200 = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w200,
);
var mont300 = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w300,
);
var montreg = TextStyle(
  fontSize: 16.0,
);
var mont500 = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
);
var mont600 = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
);
var mont700 = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
);
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
              fontFamily: "Montserrat",
              textTheme: TextTheme(
                headline4: mont700,
                headline5: mont600,
                headline6: mont500,
                caption: montreg,
                bodyText1: mont300,
                bodyText2: mont200,
              ),
      ),
      home: Login(),
    );
  }
}

