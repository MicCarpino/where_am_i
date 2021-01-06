import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_event.dart';

final sl = GetIt.instance;

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
