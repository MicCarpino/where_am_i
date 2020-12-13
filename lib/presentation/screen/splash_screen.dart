import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_event.dart';

final sl = GetIt.instance;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    Future.delayed(Duration(seconds: 2), () async {
      authenticationBloc.add(OnSplashScreenShowing());
    });
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
