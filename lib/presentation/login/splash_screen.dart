import 'package:flutter/material.dart';
import 'package:where_am_i/presentation/core/dnc_animated_logo.dart';

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
        child: DncAnimatedLogo(),
      ),
    );
  }
}
