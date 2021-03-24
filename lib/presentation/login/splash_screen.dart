import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
   /* LoginBloc authenticationBloc = BlocProvider.of(context);
    Future.delayed(Duration(seconds: 2), () async {
      authenticationBloc.add(OnSplashScreenShowing());
    });*/
    return Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
