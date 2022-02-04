import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/core/utils/aes_utils.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/domain/blocs/login/login_form_field.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/injection_container.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

part 'log_in_bloc.freezed.dart';

// this bloc handle the login logic
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(this.localDataSource, this.authenticationRepository)
      : super(LogInState.initial());

  final AuthenticationRepository authenticationRepository;
  final LocalDataSource localDataSource;

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    yield* event.map(
      //emit a new state with the new value typed by the user in the username field
      usernameChanged: (value) async* {
        yield state.copyWith(
          username: LoginFormField.dirty(value.username),
          showErrorMessages: true,
          loginFailureOrSuccess: none(),
        );
      },
      //emit a new state with the new value typed by the user in the password field
      passwordChanged: (value) async* {
        yield state.copyWith(
          password: LoginFormField.dirty(value.password),
          showErrorMessages: true,
          loginFailureOrSuccess: none(),
        );
      },
      //emit a new state with the new value selected by the user for the "remember me" checkbox
      rememberMeChanged: (_) async* {
        yield state.copyWith(
          isRememberMeChecked: !state.isRememberMeChecked,
          loginFailureOrSuccess: none(),
        );
      },
      //emit a new state indicating if the password should be hidden after the user hit the show/hide icon
      passwordVisibilityChanged: (_) async* {
        yield state.copyWith(
          isPasswordHidden: !state.isPasswordHidden,
          loginFailureOrSuccess: none(),
        );
      },
      //validate username and password values and perform the login api call
      performLogin: (_) async* {
        yield state.copyWith(isLoading: true, loginFailureOrSuccess: none());
        //validate the username/password values of the current state
        if (Formz.validate([state.username, state.password]).isValid) {
          //perform login
          final logInResult =
              await authenticationRepository.performUserAuthentication(
                  state.username.value, state.password.value);
          //emit state with the login result
          yield state.copyWith(
            isLoading: false,
            //show error messages in the Formz username/password objects
            showErrorMessages: true,
            //if the login has failed emit "some"
            loginFailureOrSuccess: optionOf(
              logInResult.fold(
                //login failed, emit "some - left"
                (failure) => Left(failure.getErrorMessageFromFailure()),
                //login successful, emit "some - right"
                (authenticatedUser) {
                  localDataSource.cacheLoggedUser(authenticatedUser);
                  //if the remember me checkbox is checked store the username and password values
                  state.isRememberMeChecked
                      ? localDataSource.storeCredentials(
                          state.username.value,
                          state.password.value,
                        )
                  //otherwise remove possible values previously stored
                      : localDataSource.removeStoredCredentials();
                  return Right(unit);
                },
              ),
            ),
          );
          //username and password validation has failed, emit the new state
          //showing the error in the Formz object
        } else {
          yield state.copyWith(
            isLoading: false,
            showErrorMessages: true,
            username: LoginFormField.dirty(state.username.value),
            password: LoginFormField.dirty(state.password.value),
            loginFailureOrSuccess: none(),
          );
        }
      },
    );
  }
}
