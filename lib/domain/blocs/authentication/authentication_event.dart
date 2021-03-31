part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationTokenExpired extends AuthenticationEvent {}

class WorkstationAssigned extends AuthenticationEvent {
  const WorkstationAssigned(this.workstationCode);

  final int workstationCode;

  @override
  List<Object> get props => [workstationCode];
}
