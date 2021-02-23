import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

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
    } else if (event is AuthenticationLogoutRequested) {
      print('PERFORMING MANUAL LOGOUT');
      await performLogOut();
    } else if (event is AuthenticationTokenExpired) {
      print('PERFORMING 401 LOGOUT');
      await performLogOut(tokenExpired: true);
    }
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final user = await _authenticationRepository.getLoggedUser();
        return user.fold((l) => AuthenticationState.unauthenticated(),
            (user) => AuthenticationState.authenticated(user));
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
