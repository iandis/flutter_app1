
import 'package:flutter/material.dart';
import 'package:flutter_app1/detailscreen.dart';
import 'package:flutter_app1/postdetailscreen.dart';

import '../loginscreen.dart';

class AppRoutes{
  static const String loginScreen = '/login';
  static const String detailScreen = '/detail';
  static const String postDetailScreen = '/postdetail';
}

class CustomRouter{

static Route onGenerateRoute(RouteSettings settings){
  return MaterialPageRoute(builder: (_) {
    switch(settings.name){
      case AppRoutes.detailScreen:
        var user = settings.arguments;
        return DetailScreen(user: user);
      case AppRoutes.postDetailScreen:
        var args = settings.arguments as List;
        return PostDetailScreen(
          userName: args[0],
          tourismPlace: args[1],
        );
      case AppRoutes.loginScreen:
      default:
        return Login();
      }
    });
  }
}