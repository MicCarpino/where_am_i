import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoggedInState extends LoginState {}

class LoggedOutState extends LoginState {
  final bool hasTokenExpired;

  LoggedOutState({this.hasTokenExpired = false});
}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({this.error});
}
