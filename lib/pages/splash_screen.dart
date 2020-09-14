import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/pages/home_screen.dart';
import 'package:where_am_i/pages/login_screen.dart';
import 'package:where_am_i/utilities/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 3), () {
      checkUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Center(child: Text('Loading...'))));
  }

  Future checkUserLogged() async {
    if (sharedPreferences.jwtToken == null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return new LoginScreen();
      }));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return new HomeScreen();
      }));
    }
  }
}
