part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class InvalidInput extends LoginState {
  final bool invalidUsername;
  final bool invalidPassword;

  InvalidInput(this.invalidUsername, this.invalidPassword);

  @override
  List<Object> get props => [invalidUsername, invalidPassword];
}

class Loading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessful extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
