part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => const <dynamic>[];
}

class OnLoginButtonClick extends LoginEvent {
  final String inUsername;
  final String inPassword;

  OnLoginButtonClick(this.inUsername, this.inPassword)
      : super([inUsername, inPassword]);
}
