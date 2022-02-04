import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// this widget it's used only in the login form
class LoginButton extends StatelessWidget {
  final isLoading;

  LoginButton({this.isLoading = false});

  //if login state is loading build a loading indicator, otherwise a button
  //which add the "perform login event" to the login bloc
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CenteredLoading(width: 40, height: 40)
        : MaterialButton(
            elevation: 5.0,
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            onPressed: () =>
                context.read<LogInBloc>().add(LogInEvent.performLogin()),
            color: dncBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          );
  }
}
