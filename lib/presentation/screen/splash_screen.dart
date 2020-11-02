import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/usecases/get_logged_user.dart';
import 'package:where_am_i/presentation/screen/login_screen.dart';
import 'package:where_am_i/presentation/screen/home_screen.dart';
import 'package:where_am_i/user_service.dart';

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
      var loggedUser = await sl<GetLoggedUser>().call(NoParams());
      loggedUser.fold(
          (userNotFound) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
          (loggedUser) {
        GetIt.instance<UserService>().setLoggedUser(loggedUser.user);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    });
  }
}
