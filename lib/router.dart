import 'package:flutter/material.dart';
import 'package:where_am_i/pages/home_screen.dart';
import 'package:where_am_i/pages/login_screen.dart';
import 'package:where_am_i/utilities/constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
