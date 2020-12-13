import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
import 'package:where_am_i/domain/usecases/users/get_logged_user.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_event.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_state.dart';

//ignore:
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PerformLogIn performLogIn;
  final PerformLogOut performLogOut;
  final GetLoggedUser getLoggedUser;

  AuthenticationBloc({
    @required PerformLogIn performLogIn,
    @required PerformLogOut performLogOut,
    @required GetLoggedUser getLoggedUser,
  })  : assert(performLogIn != null),
        assert(performLogOut != null),
        assert(getLoggedUser != null),
        performLogIn = performLogIn,
        performLogOut = performLogOut,
        getLoggedUser = getLoggedUser,
        super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is OnSplashScreenShowing) {
      var isUserLogged = await getLoggedUser(NoParams());
     yield isUserLogged.fold(
            (failure) => LoggedOutState(),
            (authenticatedUser) => LoggedInState(),
      );
    }
    if (event is OnLoginButtonPressed) {
      yield LoginLoadingState();
      final result = await performLogIn(
          LoginParams(username: event.username, password: event.password));
      yield result.fold((failure) {
        //TODO: shows error message returned from server
        if (failure is ServerFailure) {
          return LoginFailureState(error: failure.errorMessage);
        } else if (failure is UnexpectedFailure) {
          return LoginFailureState(error: failure.errorMessage);
        } else {
          return LoginFailureState(error: failure.toString());
        }
      }, (loggedUser) => LoggedInState());
    } else if (event is OnLogoutEvent) {
      final logoutResult = await performLogOut(NoParams());
      yield LoggedOutState();
      yield logoutResult.fold((failure) {
        //TODO: shows error message returned from server
        /*if (failure is ServerFailure) {
          return FailureState(error: failure.errorMessage);
        }*/
        return LoginFailureState(error: 'Log out unsuccessful');
      }, (success) => LoggedOutState());
    }
  }
}
