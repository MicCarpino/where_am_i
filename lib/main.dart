import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where_am_i/pages/home_screen.dart';
import 'package:where_am_i/utilities/constants.dart';
import 'pages/login_screen.dart';
import 'pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: dncBlue, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
      LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
      HOME_SCREEN: (BuildContext context) => HomeScreen(),
      //GRID_ITEM_DETAILS_SCREEN: (BuildContext context) => GridItemDetails(),
    },
    );
  }
}
