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
        yield result.fold((failure) => FailureState(error: failure.toString()),
            (loggedUser) => LoggedInState());
    }
  }
}
