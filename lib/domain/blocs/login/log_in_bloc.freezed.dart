// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'log_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LogInEventTearOff {
  const _$LogInEventTearOff();

// ignore: unused_element
  _PasswordChanged passwordChanged(String password) {
    return _PasswordChanged(
      password,
    );
  }

// ignore: unused_element
  _UsernameChanged usernameChanged(String username) {
    return _UsernameChanged(
      username,
    );
  }

// ignore: unused_element
  _RememberMeChanged rememberMeChanged() {
    return const _RememberMeChanged();
  }

// ignore: unused_element
  _PasswordVisibilityChanged passwordVisibilityChanged() {
    return const _PasswordVisibilityChanged();
  }

// ignore: unused_element
  _PerformLogin performLogin() {
    return const _PerformLogin();
  }
}

/// @nodoc
// ignore: unused_element
const $LogInEvent = _$LogInEventTearOff();

/// @nodoc
mixin _$LogInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $LogInEventCopyWith<$Res> {
  factory $LogInEventCopyWith(
          LogInEvent value, $Res Function(LogInEvent) then) =
      _$LogInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LogInEventCopyWithImpl<$Res> implements $LogInEventCopyWith<$Res> {
  _$LogInEventCopyWithImpl(this._value, this._then);

  final LogInEvent _value;
  // ignore: unused_field
  final $Res Function(LogInEvent) _then;
}

/// @nodoc
abstract class _$PasswordChangedCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(
          _PasswordChanged value, $Res Function(_PasswordChanged) then) =
      __$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class __$PasswordChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(
      _PasswordChanged _value, $Res Function(_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _PasswordChanged));

  @override
  _PasswordChanged get _value => super._value as _PasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(_PasswordChanged(
      password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'LogInEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements LogInEvent {
  const factory _PasswordChanged(String password) = _$_PasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith;
}

/// @nodoc
abstract class _$UsernameChangedCopyWith<$Res> {
  factory _$UsernameChangedCopyWith(
          _UsernameChanged value, $Res Function(_UsernameChanged) then) =
      __$UsernameChangedCopyWithImpl<$Res>;
  $Res call({String username});
}

/// @nodoc
class __$UsernameChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements _$UsernameChangedCopyWith<$Res> {
  __$UsernameChangedCopyWithImpl(
      _UsernameChanged _value, $Res Function(_UsernameChanged) _then)
      : super(_value, (v) => _then(v as _UsernameChanged));

  @override
  _UsernameChanged get _value => super._value as _UsernameChanged;

  @override
  $Res call({
    Object username = freezed,
  }) {
    return _then(_UsernameChanged(
      username == freezed ? _value.username : username as String,
    ));
  }
}

/// @nodoc
class _$_UsernameChanged implements _UsernameChanged {
  const _$_UsernameChanged(this.username) : assert(username != null);

  @override
  final String username;

  @override
  String toString() {
    return 'LogInEvent.usernameChanged(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UsernameChanged &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$UsernameChangedCopyWith<_UsernameChanged> get copyWith =>
      __$UsernameChangedCopyWithImpl<_UsernameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return usernameChanged(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements LogInEvent {
  const factory _UsernameChanged(String username) = _$_UsernameChanged;

  String get username;
  @JsonKey(ignore: true)
  _$UsernameChangedCopyWith<_UsernameChanged> get copyWith;
}

/// @nodoc
abstract class _$RememberMeChangedCopyWith<$Res> {
  factory _$RememberMeChangedCopyWith(
          _RememberMeChanged value, $Res Function(_RememberMeChanged) then) =
      __$RememberMeChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$RememberMeChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements _$RememberMeChangedCopyWith<$Res> {
  __$RememberMeChangedCopyWithImpl(
      _RememberMeChanged _value, $Res Function(_RememberMeChanged) _then)
      : super(_value, (v) => _then(v as _RememberMeChanged));

  @override
  _RememberMeChanged get _value => super._value as _RememberMeChanged;
}

/// @nodoc
class _$_RememberMeChanged implements _RememberMeChanged {
  const _$_RememberMeChanged();

  @override
  String toString() {
    return 'LogInEvent.rememberMeChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RememberMeChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return rememberMeChanged();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (rememberMeChanged != null) {
      return rememberMeChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return rememberMeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (rememberMeChanged != null) {
      return rememberMeChanged(this);
    }
    return orElse();
  }
}

abstract class _RememberMeChanged implements LogInEvent {
  const factory _RememberMeChanged() = _$_RememberMeChanged;
}

/// @nodoc
abstract class _$PasswordVisibilityChangedCopyWith<$Res> {
  factory _$PasswordVisibilityChangedCopyWith(_PasswordVisibilityChanged value,
          $Res Function(_PasswordVisibilityChanged) then) =
      __$PasswordVisibilityChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PasswordVisibilityChangedCopyWithImpl<$Res>
    extends _$LogInEventCopyWithImpl<$Res>
    implements _$PasswordVisibilityChangedCopyWith<$Res> {
  __$PasswordVisibilityChangedCopyWithImpl(_PasswordVisibilityChanged _value,
      $Res Function(_PasswordVisibilityChanged) _then)
      : super(_value, (v) => _then(v as _PasswordVisibilityChanged));

  @override
  _PasswordVisibilityChanged get _value =>
      super._value as _PasswordVisibilityChanged;
}

/// @nodoc
class _$_PasswordVisibilityChanged implements _PasswordVisibilityChanged {
  const _$_PasswordVisibilityChanged();

  @override
  String toString() {
    return 'LogInEvent.passwordVisibilityChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PasswordVisibilityChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return passwordVisibilityChanged();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return passwordVisibilityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibilityChanged implements LogInEvent {
  const factory _PasswordVisibilityChanged() = _$_PasswordVisibilityChanged;
}

/// @nodoc
abstract class _$PerformLoginCopyWith<$Res> {
  factory _$PerformLoginCopyWith(
          _PerformLogin value, $Res Function(_PerformLogin) then) =
      __$PerformLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$PerformLoginCopyWithImpl<$Res> extends _$LogInEventCopyWithImpl<$Res>
    implements _$PerformLoginCopyWith<$Res> {
  __$PerformLoginCopyWithImpl(
      _PerformLogin _value, $Res Function(_PerformLogin) _then)
      : super(_value, (v) => _then(v as _PerformLogin));

  @override
  _PerformLogin get _value => super._value as _PerformLogin;
}

/// @nodoc
class _$_PerformLogin implements _PerformLogin {
  const _$_PerformLogin();

  @override
  String toString() {
    return 'LogInEvent.performLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PerformLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult passwordChanged(String password),
    @required TResult usernameChanged(String username),
    @required TResult rememberMeChanged(),
    @required TResult passwordVisibilityChanged(),
    @required TResult performLogin(),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return performLogin();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult passwordChanged(String password),
    TResult usernameChanged(String username),
    TResult rememberMeChanged(),
    TResult passwordVisibilityChanged(),
    TResult performLogin(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (performLogin != null) {
      return performLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult passwordChanged(_PasswordChanged value),
    @required TResult usernameChanged(_UsernameChanged value),
    @required TResult rememberMeChanged(_RememberMeChanged value),
    @required
        TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    @required TResult performLogin(_PerformLogin value),
  }) {
    assert(passwordChanged != null);
    assert(usernameChanged != null);
    assert(rememberMeChanged != null);
    assert(passwordVisibilityChanged != null);
    assert(performLogin != null);
    return performLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult passwordChanged(_PasswordChanged value),
    TResult usernameChanged(_UsernameChanged value),
    TResult rememberMeChanged(_RememberMeChanged value),
    TResult passwordVisibilityChanged(_PasswordVisibilityChanged value),
    TResult performLogin(_PerformLogin value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (performLogin != null) {
      return performLogin(this);
    }
    return orElse();
  }
}

abstract class _PerformLogin implements LogInEvent {
  const factory _PerformLogin() = _$_PerformLogin;
}

/// @nodoc
class _$LogInStateTearOff {
  const _$LogInStateTearOff();

// ignore: unused_element
  _LogInState call(
      {@required LoginFormField username,
      @required LoginFormField password,
      @required bool isPasswordVisible,
      @required bool isRememberMeChecked,
      @required bool isLoading,
      @required bool showErrorMessages,
      @required Option<Either<String, Unit>> loginFailureOrSuccess}) {
    return _LogInState(
      username: username,
      password: password,
      isPasswordVisible: isPasswordVisible,
      isRememberMeChecked: isRememberMeChecked,
      isLoading: isLoading,
      showErrorMessages: showErrorMessages,
      loginFailureOrSuccess: loginFailureOrSuccess,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LogInState = _$LogInStateTearOff();

/// @nodoc
mixin _$LogInState {
  LoginFormField get username;
  LoginFormField get password;
  bool get isPasswordVisible;
  bool get isRememberMeChecked;
  bool get isLoading;
  bool get showErrorMessages;
  Option<Either<String, Unit>> get loginFailureOrSuccess;

  @JsonKey(ignore: true)
  $LogInStateCopyWith<LogInState> get copyWith;
}

/// @nodoc
abstract class $LogInStateCopyWith<$Res> {
  factory $LogInStateCopyWith(
          LogInState value, $Res Function(LogInState) then) =
      _$LogInStateCopyWithImpl<$Res>;
  $Res call(
      {LoginFormField username,
      LoginFormField password,
      bool isPasswordVisible,
      bool isRememberMeChecked,
      bool isLoading,
      bool showErrorMessages,
      Option<Either<String, Unit>> loginFailureOrSuccess});
}

/// @nodoc
class _$LogInStateCopyWithImpl<$Res> implements $LogInStateCopyWith<$Res> {
  _$LogInStateCopyWithImpl(this._value, this._then);

  final LogInState _value;
  // ignore: unused_field
  final $Res Function(LogInState) _then;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object isPasswordVisible = freezed,
    Object isRememberMeChecked = freezed,
    Object isLoading = freezed,
    Object showErrorMessages = freezed,
    Object loginFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      username:
          username == freezed ? _value.username : username as LoginFormField,
      password:
          password == freezed ? _value.password : password as LoginFormField,
      isPasswordVisible: isPasswordVisible == freezed
          ? _value.isPasswordVisible
          : isPasswordVisible as bool,
      isRememberMeChecked: isRememberMeChecked == freezed
          ? _value.isRememberMeChecked
          : isRememberMeChecked as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      loginFailureOrSuccess: loginFailureOrSuccess == freezed
          ? _value.loginFailureOrSuccess
          : loginFailureOrSuccess as Option<Either<String, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$LogInStateCopyWith<$Res> implements $LogInStateCopyWith<$Res> {
  factory _$LogInStateCopyWith(
          _LogInState value, $Res Function(_LogInState) then) =
      __$LogInStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LoginFormField username,
      LoginFormField password,
      bool isPasswordVisible,
      bool isRememberMeChecked,
      bool isLoading,
      bool showErrorMessages,
      Option<Either<String, Unit>> loginFailureOrSuccess});
}

/// @nodoc
class __$LogInStateCopyWithImpl<$Res> extends _$LogInStateCopyWithImpl<$Res>
    implements _$LogInStateCopyWith<$Res> {
  __$LogInStateCopyWithImpl(
      _LogInState _value, $Res Function(_LogInState) _then)
      : super(_value, (v) => _then(v as _LogInState));

  @override
  _LogInState get _value => super._value as _LogInState;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object isPasswordVisible = freezed,
    Object isRememberMeChecked = freezed,
    Object isLoading = freezed,
    Object showErrorMessages = freezed,
    Object loginFailureOrSuccess = freezed,
  }) {
    return _then(_LogInState(
      username:
          username == freezed ? _value.username : username as LoginFormField,
      password:
          password == freezed ? _value.password : password as LoginFormField,
      isPasswordVisible: isPasswordVisible == freezed
          ? _value.isPasswordVisible
          : isPasswordVisible as bool,
      isRememberMeChecked: isRememberMeChecked == freezed
          ? _value.isRememberMeChecked
          : isRememberMeChecked as bool,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      loginFailureOrSuccess: loginFailureOrSuccess == freezed
          ? _value.loginFailureOrSuccess
          : loginFailureOrSuccess as Option<Either<String, Unit>>,
    ));
  }
}

/// @nodoc
class _$_LogInState implements _LogInState {
  const _$_LogInState(
      {@required this.username,
      @required this.password,
      @required this.isPasswordVisible,
      @required this.isRememberMeChecked,
      @required this.isLoading,
      @required this.showErrorMessages,
      @required this.loginFailureOrSuccess})
      : assert(username != null),
        assert(password != null),
        assert(isPasswordVisible != null),
        assert(isRememberMeChecked != null),
        assert(isLoading != null),
        assert(showErrorMessages != null),
        assert(loginFailureOrSuccess != null);

  @override
  final LoginFormField username;
  @override
  final LoginFormField password;
  @override
  final bool isPasswordVisible;
  @override
  final bool isRememberMeChecked;
  @override
  final bool isLoading;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<String, Unit>> loginFailureOrSuccess;

  @override
  String toString() {
    return 'LogInState(username: $username, password: $password, isPasswordVisible: $isPasswordVisible, isRememberMeChecked: $isRememberMeChecked, isLoading: $isLoading, showErrorMessages: $showErrorMessages, loginFailureOrSuccess: $loginFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LogInState &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordVisible, isPasswordVisible)) &&
            (identical(other.isRememberMeChecked, isRememberMeChecked) ||
                const DeepCollectionEquality()
                    .equals(other.isRememberMeChecked, isRememberMeChecked)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.loginFailureOrSuccess, loginFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.loginFailureOrSuccess, loginFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isPasswordVisible) ^
      const DeepCollectionEquality().hash(isRememberMeChecked) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(loginFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$LogInStateCopyWith<_LogInState> get copyWith =>
      __$LogInStateCopyWithImpl<_LogInState>(this, _$identity);
}

abstract class _LogInState implements LogInState {
  const factory _LogInState(
          {@required LoginFormField username,
          @required LoginFormField password,
          @required bool isPasswordVisible,
          @required bool isRememberMeChecked,
          @required bool isLoading,
          @required bool showErrorMessages,
          @required Option<Either<String, Unit>> loginFailureOrSuccess}) =
      _$_LogInState;

  @override
  LoginFormField get username;
  @override
  LoginFormField get password;
  @override
  bool get isPasswordVisible;
  @override
  bool get isRememberMeChecked;
  @override
  bool get isLoading;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<String, Unit>> get loginFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$LogInStateCopyWith<_LogInState> get copyWith;
}
