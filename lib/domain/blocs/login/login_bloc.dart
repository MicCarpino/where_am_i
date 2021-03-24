import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/blocs/login/login_event.dart';
import 'package:where_am_i/domain/blocs/login/login_state.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/domain/usecases/users/get_logged_user.dart';

//ignore:
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PerformLogIn performLogIn;
  final PerformLogOut performLogOut;
  final GetLoggedUser getLoggedUser;

  LoginBloc({
    @required PerformLogIn performLogIn,
    @required PerformLogOut performLogOut,
    @required GetLoggedUser getLoggedUser,
  })  : assert(performLogIn != null),
        assert(performLogOut != null),
        assert(getLoggedUser != null),
        performLogIn = performLogIn,
        performLogOut = performLogOut,
        getLoggedUser = getLoggedUser,
        super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnLoginButtonPressed) {
      yield* _mapLoginSubmittedState(event);
    }
  }

  Stream<LoginState> _mapLoginSubmittedState(
      OnLoginButtonPressed event) async* {
    yield LoginLoadingState();
    var loginParameters = LoginParams(
      username: event.username,
      password: event.password,
      isRememberChecked: event.isRememberMeChecked,
    );
    final result = await performLogIn(loginParameters);
    yield result.fold((failure) {
      if (failure is ServerFailure) {
        return LoginFailureState(error: failure.errorMessage);
      } else if (failure is UnexpectedFailure) {
        return LoginFailureState(error: failure.errorMessage);
      } else {
        return LoginFailureState(error: failure.toString());
      }
    }, (loggedUser) => LoggedInState());
  }
}
