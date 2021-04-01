part of 'log_in_bloc.dart';

@freezed
abstract class LogInEvent with _$LogInEvent{
 const factory LogInEvent.passwordChanged(String password) = _PasswordChanged;
 const factory LogInEvent.usernameChanged(String username) = _UsernameChanged;
 const factory LogInEvent.rememberMeChanged() = _RememberMeChanged;
 const factory LogInEvent.passwordVisibilityChanged() = _PasswordVisibilityChanged;
 const factory LogInEvent.performLogin() = _PerformLogin;
}
