import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:where_am_i/domain/usecases/get_logged_user.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';
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
  LoginState get initialState => LoadingState();

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
        /*if (failure is ServerFailure) {
          return FailureState(error: failure.errorMessage);
        }*/
        return FailureState(error: failure.toString());
      }, (loggedUser) => LoggedInState());
    }
  }
}
