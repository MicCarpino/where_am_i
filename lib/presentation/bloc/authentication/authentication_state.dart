import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class LoggedInState extends AuthenticationState {}

class LoggedOutState extends AuthenticationState {}

class LoginLoadingState extends AuthenticationState {}

class LoginFailureState extends AuthenticationState {
  final String error;

  LoginFailureState({this.error});
}
