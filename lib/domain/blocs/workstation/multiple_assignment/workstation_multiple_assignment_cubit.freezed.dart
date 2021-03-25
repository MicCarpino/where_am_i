// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation_multiple_assignment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WorkstationMultipleAssignmentStateTearOff {
  const _$WorkstationMultipleAssignmentStateTearOff();

// ignore: unused_element
  _LoadingState loadingState() {
    return const _LoadingState();
  }

// ignore: unused_element
  _LoadedState loadedState(List<Workstation> presences) {
    return _LoadedState(
      presences,
    );
  }

// ignore: unused_element
  _ErrorState errorState(Failure failure) {
    return _ErrorState(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationMultipleAssignmentState =
    _$WorkstationMultipleAssignmentStateTearOff();

/// @nodoc
mixin _$WorkstationMultipleAssignmentState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(),
    @required TResult loadedState(List<Workstation> presences),
    @required TResult errorState(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(),
    TResult loadedState(List<Workstation> presences),
    TResult errorState(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(_LoadingState value),
    @required TResult loadedState(_LoadedState value),
    @required TResult errorState(_ErrorState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(_LoadingState value),
    TResult loadedState(_LoadedState value),
    TResult errorState(_ErrorState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $WorkstationMultipleAssignmentStateCopyWith<$Res> {
  factory $WorkstationMultipleAssignmentStateCopyWith(
          WorkstationMultipleAssignmentState value,
          $Res Function(WorkstationMultipleAssignmentState) then) =
      _$WorkstationMultipleAssignmentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkstationMultipleAssignmentStateCopyWithImpl<$Res>
    implements $WorkstationMultipleAssignmentStateCopyWith<$Res> {
  _$WorkstationMultipleAssignmentStateCopyWithImpl(this._value, this._then);

  final WorkstationMultipleAssignmentState _value;
  // ignore: unused_field
  final $Res Function(WorkstationMultipleAssignmentState) _then;
}

/// @nodoc
abstract class _$LoadingStateCopyWith<$Res> {
  factory _$LoadingStateCopyWith(
          _LoadingState value, $Res Function(_LoadingState) then) =
      __$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingStateCopyWithImpl<$Res>
    extends _$WorkstationMultipleAssignmentStateCopyWithImpl<$Res>
    implements _$LoadingStateCopyWith<$Res> {
  __$LoadingStateCopyWithImpl(
      _LoadingState _value, $Res Function(_LoadingState) _then)
      : super(_value, (v) => _then(v as _LoadingState));

  @override
  _LoadingState get _value => super._value as _LoadingState;
}

/// @nodoc
class _$_LoadingState implements _LoadingState {
  const _$_LoadingState();

  @override
  String toString() {
    return 'WorkstationMultipleAssignmentState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(),
    @required TResult loadedState(List<Workstation> presences),
    @required TResult errorState(Failure failure),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(),
    TResult loadedState(List<Workstation> presences),
    TResult errorState(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(_LoadingState value),
    @required TResult loadedState(_LoadedState value),
    @required TResult errorState(_ErrorState value),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(_LoadingState value),
    TResult loadedState(_LoadedState value),
    TResult errorState(_ErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements WorkstationMultipleAssignmentState {
  const factory _LoadingState() = _$_LoadingState;
}

/// @nodoc
abstract class _$LoadedStateCopyWith<$Res> {
  factory _$LoadedStateCopyWith(
          _LoadedState value, $Res Function(_LoadedState) then) =
      __$LoadedStateCopyWithImpl<$Res>;
  $Res call({List<Workstation> presences});
}

/// @nodoc
class __$LoadedStateCopyWithImpl<$Res>
    extends _$WorkstationMultipleAssignmentStateCopyWithImpl<$Res>
    implements _$LoadedStateCopyWith<$Res> {
  __$LoadedStateCopyWithImpl(
      _LoadedState _value, $Res Function(_LoadedState) _then)
      : super(_value, (v) => _then(v as _LoadedState));

  @override
  _LoadedState get _value => super._value as _LoadedState;

  @override
  $Res call({
    Object presences = freezed,
  }) {
    return _then(_LoadedState(
      presences == freezed ? _value.presences : presences as List<Workstation>,
    ));
  }
}

/// @nodoc
class _$_LoadedState implements _LoadedState {
  const _$_LoadedState(this.presences) : assert(presences != null);

  @override
  final List<Workstation> presences;

  @override
  String toString() {
    return 'WorkstationMultipleAssignmentState.loadedState(presences: $presences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadedState &&
            (identical(other.presences, presences) ||
                const DeepCollectionEquality()
                    .equals(other.presences, presences)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(presences);

  @JsonKey(ignore: true)
  @override
  _$LoadedStateCopyWith<_LoadedState> get copyWith =>
      __$LoadedStateCopyWithImpl<_LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(),
    @required TResult loadedState(List<Workstation> presences),
    @required TResult errorState(Failure failure),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadedState(presences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(),
    TResult loadedState(List<Workstation> presences),
    TResult errorState(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(presences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(_LoadingState value),
    @required TResult loadedState(_LoadedState value),
    @required TResult errorState(_ErrorState value),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(_LoadingState value),
    TResult loadedState(_LoadedState value),
    TResult errorState(_ErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements WorkstationMultipleAssignmentState {
  const factory _LoadedState(List<Workstation> presences) = _$_LoadedState;

  List<Workstation> get presences;
  @JsonKey(ignore: true)
  _$LoadedStateCopyWith<_LoadedState> get copyWith;
}

/// @nodoc
abstract class _$ErrorStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState value, $Res Function(_ErrorState) then) =
      __$ErrorStateCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    extends _$WorkstationMultipleAssignmentStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(
      _ErrorState _value, $Res Function(_ErrorState) _then)
      : super(_value, (v) => _then(v as _ErrorState));

  @override
  _ErrorState get _value => super._value as _ErrorState;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_ErrorState(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_ErrorState implements _ErrorState {
  const _$_ErrorState(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'WorkstationMultipleAssignmentState.errorState(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$ErrorStateCopyWith<_ErrorState> get copyWith =>
      __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(),
    @required TResult loadedState(List<Workstation> presences),
    @required TResult errorState(Failure failure),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return errorState(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(),
    TResult loadedState(List<Workstation> presences),
    TResult errorState(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(_LoadingState value),
    @required TResult loadedState(_LoadedState value),
    @required TResult errorState(_ErrorState value),
  }) {
    assert(loadingState != null);
    assert(loadedState != null);
    assert(errorState != null);
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(_LoadingState value),
    TResult loadedState(_LoadedState value),
    TResult errorState(_ErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements WorkstationMultipleAssignmentState {
  const factory _ErrorState(Failure failure) = _$_ErrorState;

  Failure get failure;
  @JsonKey(ignore: true)
  _$ErrorStateCopyWith<_ErrorState> get copyWith;
}
