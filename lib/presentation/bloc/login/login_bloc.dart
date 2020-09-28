import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import './bloc.dart';

//ignore:
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PerformLogIn performLogIn;

  LoginBloc({
    @required PerformLogIn performLogIn,
  })  : assert(performLogIn != null),
        performLogIn = performLogIn,
        super(LoadingState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoadingState();
      final result = await performLogIn.loginRepository
          .performUserAuthentication(event.username, event.password);
      yield result.fold((failure) {
        //TODO: shows error message returned from server
        if (failure is ServerFailure) {
          return FailureState(error: failure.errorMessage);
        }
        return FailureState(error: failure.toString());
      }, (loggedUser) => LoggedInState());
    }
  }
}
