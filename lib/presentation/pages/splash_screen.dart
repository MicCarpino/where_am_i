import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/SharedPreferencesManager.dart';
import 'package:where_am_i/presentation/pages/home_screen.dart';
import 'package:where_am_i/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }

  // perform auto login if creds are saved to shared prefs
  void autoLogin() async {
    var userEmail = await SharedPreferencesManager.getuserEmail();
    var userPass = await SharedPreferencesManager.getuserPass();
    if (userEmail != null && userPass != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
