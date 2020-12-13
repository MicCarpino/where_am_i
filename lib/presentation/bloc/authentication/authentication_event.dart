import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {}

class OnSplashScreenShowing extends AuthenticationEvent{}

class OnLoginButtonPressed extends AuthenticationEvent {
  final String username;
  final String password;

  OnLoginButtonPressed({this.username, this.password});
}

class OnLogoutEvent extends AuthenticationEvent {}