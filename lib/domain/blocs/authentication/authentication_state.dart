part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.authenticationStatus = AuthenticationStatus.unknown,
    this.authenticatedUser,
    this.assignedWorkstation,
  });

  final AuthenticationStatus authenticationStatus;
  final AuthenticatedUser authenticatedUser;
  final int assignedWorkstation;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(
    AuthenticatedUser user,
    int assignedWorkstation,
  ) : this._(
          authenticationStatus: AuthenticationStatus.authenticated,
          authenticatedUser: user,
          assignedWorkstation: assignedWorkstation,
        );

  const AuthenticationState.unauthenticated()
      : this._(authenticationStatus: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [authenticationStatus, authenticatedUser,assignedWorkstation];
}
