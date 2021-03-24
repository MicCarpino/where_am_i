part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.authenticationStatus = AuthenticationStatus.unknown,
    this.authenticatedUser,
  });

  final AuthenticationStatus authenticationStatus;
  final AuthenticatedUser authenticatedUser;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(AuthenticatedUser user)
      : this._(
          authenticationStatus: AuthenticationStatus.authenticated,
          authenticatedUser: user,
        );

  const AuthenticationState.unauthenticated()
      : this._(authenticationStatus: AuthenticationStatus.unauthenticated);


  @override
  List<Object> get props => [authenticationStatus, authenticatedUser];
}
