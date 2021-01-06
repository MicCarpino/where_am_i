import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class OnLoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  OnLoginButtonPressed({this.username, this.password});
}

class OnLogoutEvent extends LoginEvent {
  final bool hasTokenExpired;
  OnLogoutEvent({this.hasTokenExpired = false});
}