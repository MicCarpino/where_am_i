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
    var usrCryptString = sharedPreferences.getStringList(STORED_USERNAME);
    var pwCryptString = sharedPreferences.getStringList(STORED_PASSWORD);
    if(usrCryptString !=null && pwCryptString != null){
      final aes = AesUtils();
      List<int> usrCryptInt = usrCryptString.map((e) => int.parse(e)).toList();
      storedUsername =  aes.decrypt(usrCryptInt);
      List<int> pwCryptInt = pwCryptString.map((e) => int.parse(e)).toList();
      storedPassword = aes.decrypt(pwCryptInt);
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
