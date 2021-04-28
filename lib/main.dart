import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/loginscreen.dart';

import 'customs/customrouter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
              primaryColor: Color(0xff191e3b),
              backgroundColor: Color(0xff191e3b),
              brightness: Brightness.dark,

              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color(0xff40C4FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xff40C4FF),
                  )
              ),
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              }),
              errorColor: Color(0xffB00020),
              accentColor: Color(0xff40C4FF),
              fontFamily: "Montserrat",
      ),
      home: Login(),
      onGenerateRoute: CustomRouter.onGenerateRoute,
    );
  }
}

