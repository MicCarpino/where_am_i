part of 'log_in_bloc.dart';

@freezed
abstract class LogInState with _$LogInState {
  const factory LogInState({
    @required LoginFormField username,
    @required LoginFormField password,
    @required bool isPasswordHidden,
    @required bool isRememberMeChecked,
    @required bool isLoading,
    @required bool showErrorMessages,
    @required Option<Either<String, Unit>> loginFailureOrSuccess,
  }) = _LogInState;

  factory LogInState.initial() {
    var storedUsername;
    var storedPassword;
    final sharedPreferences = getIt<SharedPreferences>();

    if (sharedPreferences.getBool(IS_REMEMBER_ME_CHECKED) ?? false) {
      storedUsername = sharedPreferences.getString(STORED_USERNAME);
      storedPassword = sharedPreferences.getString(STORED_PASSWORD);
    }
    return LogInState(
      username: storedUsername == null
          ? LoginFormField.pure()
          : LoginFormField.dirty(storedUsername),
      password: storedUsername == null
          ? LoginFormField.pure()
          : LoginFormField.dirty(storedPassword),
      isPasswordHidden: true,
      isRememberMeChecked: storedPassword != null && storedPassword != null,
      isLoading: false,
      showErrorMessages: false,
      loginFailureOrSuccess: none(),
    );
  }
}
