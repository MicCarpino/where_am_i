import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingState extends LoginState {}

class LoggedInState extends LoginState {}

class FailureState extends LoginState {
  final String error;

  FailureState({this.error});
}
