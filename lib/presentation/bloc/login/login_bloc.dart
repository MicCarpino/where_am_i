import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/usecases/perform_user_authentication.dart';

part 'login_event.dart';

part 'login_state.dart';

const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid input. Username and password must not be empty';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PerformUserAuthentication performUserAuthentication;

  LoginBloc({@required PerformUserAuthentication performUserAuthentication})
      : assert(performUserAuthentication != null),
        performUserAuthentication = performUserAuthentication,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnLoginButtonClick) {
      if (event.inUsername.isEmpty || event.inPassword.isEmpty) {
        yield LoginError(errorMessage: INVALID_INPUT_FAILURE_MESSAGE);
      } else {
        yield Loading();
        final loginResult = await performUserAuthentication(LoginParams(
            username: event.inUsername, password: event.inPassword));
        yield* _loginSuccessOrErrorState(loginResult);
      }
    }
  }

  Stream<LoginState> _loginSuccessOrErrorState(
      Either<Failure, void> loginSuccessOrError) async* {
    yield loginSuccessOrError.fold(
        (failure) => LoginError(errorMessage: failure.toString()),
        (success) => LoginSuccessful());
  }
}
