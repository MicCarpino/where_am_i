import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/domain/blocs/login/login_form_field.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/injection_container.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

part 'log_in_bloc.freezed.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(this.localDataSource, this.authenticationRepository)
      : super(LogInState.initial());

  final AuthenticationRepository authenticationRepository;
  final LocalDataSource localDataSource;

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    yield* event.map(
      usernameChanged: (value) async* {
        yield state.copyWith(
          username: LoginFormField.dirty(value.username),
          showErrorMessages: true,
          loginFailureOrSuccess: none(),
        );
      },
      passwordChanged: (value) async* {
        yield state.copyWith(
          password: LoginFormField.dirty(value.password),
          showErrorMessages: true,
          loginFailureOrSuccess: none(),
        );
      },
      rememberMeChanged: (_) async* {
        yield state.copyWith(
          isRememberMeChecked: !state.isRememberMeChecked,
          loginFailureOrSuccess: none(),
        );
      },
      passwordVisibilityChanged: (_) async* {
        yield state.copyWith(
          isPasswordHidden: !state.isPasswordHidden,
          loginFailureOrSuccess: none(),
        );
      },
      performLogin: (_) async* {
        yield state.copyWith(isLoading: true, loginFailureOrSuccess: none());
        if (Formz.validate([state.username, state.password]).isValid) {
          final logInResult =
              await authenticationRepository.performUserAuthentication(
                  state.username.value, state.password.value);
          yield state.copyWith(
            isLoading: false,
            showErrorMessages: true,
            loginFailureOrSuccess: optionOf(
              logInResult.fold(
                (failure) => Left(failure.getErrorMessageFromFailure()),
                (authenticatedUser) {
                  localDataSource.cacheLoggedUser(authenticatedUser);
                  state.isRememberMeChecked
                      ? localDataSource.storeCredentials(
                          state.username.value,
                          state.password.value,
                        )
                      : localDataSource.removeStoredCredentials();
                  return Right(unit);
                },
              ),
            ),
          );
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
