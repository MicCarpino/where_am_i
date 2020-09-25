import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/domain/usecases/get_logged_user.dart';
import 'package:where_am_i/presentation/pages/home_screen.dart';
import 'package:where_am_i/presentation/pages/login_screen.dart';

final sl = GetIt.instance;

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
  void autoLogin() {
    Future.delayed(Duration(seconds: 2), () async {
      var loggedUser =
      await sl<GetLoggedUser>().loginRepository.getLoggedUser();
      loggedUser.fold((userNotFound) =>
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen())), (
          loggedUser) =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home())));
    });
  }
}
