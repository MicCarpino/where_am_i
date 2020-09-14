import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/pages/home_screen.dart';
import 'package:where_am_i/pages/login_screen.dart';
import 'package:where_am_i/utilities/constants.dart';

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
    return Scaffold(
      body: Container(child: Center(child: Text('Loading...')))
    );
  }

  Future checkUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtToken = (prefs.getString(JWT_TOKEN) ?? null);
    if (jwtToken == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return new LoginScreen();
      }));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return new HomeScreen();
      }));
    }
  }

}
