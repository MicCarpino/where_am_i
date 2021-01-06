part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.authenticationStatus = AuthenticationStatus.unknown,
    this.authenticatedUser,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(AuthenticatedUser user)
      : this._(
          authenticationStatus: AuthenticationStatus.authenticated,
          authenticatedUser: user,
        );

  const AuthenticationState.unauthenticated()
      : this._(authenticationStatus: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus authenticationStatus;
  final AuthenticatedUser authenticatedUser;

  @override
  List<Object> get props => [authenticationStatus, authenticatedUser];
}
