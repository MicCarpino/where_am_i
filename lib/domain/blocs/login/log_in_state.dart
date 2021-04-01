part of 'log_in_bloc.dart';

@freezed
abstract class LogInState with _$LogInState {
  const factory LogInState({
    @required LoginFormField username,
    @required LoginFormField password,
    @required bool isPasswordVisible,
    @required bool isRememberMeChecked,
    @required bool isLoading,
    @required bool showErrorMessages,
    @required Option<Either<String, Unit>> loginFailureOrSuccess,
  }) = _LogInState;

  factory LogInState.initial() => LogInState(
        username: LoginFormField.pure(),
        password: LoginFormField.pure(),
        isPasswordVisible: false,
        isRememberMeChecked: false,
        isLoading: false,showErrorMessages: false,
        loginFailureOrSuccess: none(),
      );
}
