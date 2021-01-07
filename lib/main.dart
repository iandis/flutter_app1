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
      theme: ThemeData.from(colorScheme: ColorScheme.highContrastDark()),
      home: MainScreen(),
    );
  }
}

