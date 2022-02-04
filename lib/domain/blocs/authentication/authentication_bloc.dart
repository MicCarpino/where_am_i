import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

// this bloc handle the authentication logic
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PerformLogOut performLogOut;

  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    final PerformLogOut performLogOut,
  })  : assert(authenticationRepository != null),
        assert(performLogOut != null),
        _authenticationRepository = authenticationRepository,
        performLogOut = performLogOut,
        super(const AuthenticationState.unknown()) {
    //listen for authentication states changes occurring in the authentication repository
    //when this bloc is instantiated at app startup and, consequently, this listener
    // is added, the "get status" function is triggered an performs an authentication
    // status check
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
      //logout performed by the logged user
    } else if (event is AuthenticationLogoutRequested) {
      print('PERFORMING MANUAL LOGOUT');
      await performLogOut();
      //logout on API 401 response, this event comes from the auth repository
      // (function add event defined in the get it auth repo initialization)
    } else if (event is AuthenticationTokenExpired) {
      print('PERFORMING 401 LOGOUT');
      await performLogOut(tokenExpired: true);
      //in the list of presences for the current day a workstations for the
      // logged user has been found
    } else if (event is WorkstationAssigned) {
      yield AuthenticationState.authenticated(
        state.authenticatedUser,
        event.workstationCode,
      );
    }
  }

  //an authentication change event occured
  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
      //retrieving logged user details end emitting the "authenticated state"
        final user = await _authenticationRepository.getLoggedUser();
        return user.fold((l) => AuthenticationState.unauthenticated(),
            (user) => AuthenticationState.authenticated(user, null));
      default:
        return const AuthenticationState.unknown();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}
