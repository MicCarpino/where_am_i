import 'package:flutter/material.dart';
import 'package:where_am_i/router.dart';
import 'package:where_am_i/utilities/constants.dart';
import 'pages/login_screen.dart';
import 'pages/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginScreen(),
    );
  }
}