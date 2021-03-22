// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WorkstationWatcherEventTearOff {
  const _$WorkstationWatcherEventTearOff();

// ignore: unused_element
  _FetchWorkstations fetchWorkstations(DateTime date) {
    return _FetchWorkstations(
      date,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationWatcherEvent = _$WorkstationWatcherEventTearOff();

/// @nodoc
mixin _$WorkstationWatcherEvent {
  DateTime get date;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchWorkstations(DateTime date),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchWorkstations(DateTime date),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchWorkstations(_FetchWorkstations value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchWorkstations(_FetchWorkstations value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $WorkstationWatcherEventCopyWith<WorkstationWatcherEvent> get copyWith;
}

/// @nodoc
abstract class $WorkstationWatcherEventCopyWith<$Res> {
  factory $WorkstationWatcherEventCopyWith(WorkstationWatcherEvent value,
          $Res Function(WorkstationWatcherEvent) then) =
      _$WorkstationWatcherEventCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class _$WorkstationWatcherEventCopyWithImpl<$Res>
    implements $WorkstationWatcherEventCopyWith<$Res> {
  _$WorkstationWatcherEventCopyWithImpl(this._value, this._then);

  final WorkstationWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(WorkstationWatcherEvent) _then;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FetchWorkstationsCopyWith<$Res>
    implements $WorkstationWatcherEventCopyWith<$Res> {
  factory _$FetchWorkstationsCopyWith(
          _FetchWorkstations value, $Res Function(_FetchWorkstations) then) =
      __$FetchWorkstationsCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date});
}

/// @nodoc
class __$FetchWorkstationsCopyWithImpl<$Res>
    extends _$WorkstationWatcherEventCopyWithImpl<$Res>
    implements _$FetchWorkstationsCopyWith<$Res> {
  __$FetchWorkstationsCopyWithImpl(
      _FetchWorkstations _value, $Res Function(_FetchWorkstations) _then)
      : super(_value, (v) => _then(v as _FetchWorkstations));

  @override
  _FetchWorkstations get _value => super._value as _FetchWorkstations;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_FetchWorkstations(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_FetchWorkstations implements _FetchWorkstations {
  const _$_FetchWorkstations(this.date) : assert(date != null);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'WorkstationWatcherEvent.fetchWorkstations(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FetchWorkstations &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$FetchWorkstationsCopyWith<_FetchWorkstations> get copyWith =>
      __$FetchWorkstationsCopyWithImpl<_FetchWorkstations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchWorkstations(DateTime date),
  }) {
    assert(fetchWorkstations != null);
    return fetchWorkstations(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchWorkstations(DateTime date),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchWorkstations != null) {
      return fetchWorkstations(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchWorkstations(_FetchWorkstations value),
  }) {
    assert(fetchWorkstations != null);
    return fetchWorkstations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchWorkstations(_FetchWorkstations value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchWorkstations != null) {
      return fetchWorkstations(this);
    }
    return orElse();
  }
}

abstract class _FetchWorkstations implements WorkstationWatcherEvent {
  const factory _FetchWorkstations(DateTime date) = _$_FetchWorkstations;

  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$FetchWorkstationsCopyWith<_FetchWorkstations> get copyWith;
}

/// @nodoc
class _$WorkstationWatcherStateTearOff {
  const _$WorkstationWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(List<UserWithWorkstation> usersWithWorkstations) {
    return _LoadSuccess(
      usersWithWorkstations,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure(String errorMessage) {
    return _LoadFailure(
      errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationWatcherState = _$WorkstationWatcherStateTearOff();

/// @nodoc
mixin _$WorkstationWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    @required TResult loadFailure(String errorMessage),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $WorkstationWatcherStateCopyWith<$Res> {
  factory $WorkstationWatcherStateCopyWith(WorkstationWatcherState value,
          $Res Function(WorkstationWatcherState) then) =
      _$WorkstationWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkstationWatcherStateCopyWithImpl<$Res>
    implements $WorkstationWatcherStateCopyWith<$Res> {
  _$WorkstationWatcherStateCopyWithImpl(this._value, this._then);

  final WorkstationWatcherState _value;
  // ignore: unused_field
  final $Res Function(WorkstationWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$WorkstationWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'WorkstationWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    @required TResult loadFailure(String errorMessage),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WorkstationWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$WorkstationWatcherStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc
class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'WorkstationWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    @required TResult loadFailure(String errorMessage),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements WorkstationWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<UserWithWorkstation> usersWithWorkstations});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$WorkstationWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object usersWithWorkstations = freezed,
  }) {
    return _then(_LoadSuccess(
      usersWithWorkstations == freezed
          ? _value.usersWithWorkstations
          : usersWithWorkstations as List<UserWithWorkstation>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.usersWithWorkstations)
      : assert(usersWithWorkstations != null);

  @override
  final List<UserWithWorkstation> usersWithWorkstations;

  @override
  String toString() {
    return 'WorkstationWatcherState.loadSuccess(usersWithWorkstations: $usersWithWorkstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.usersWithWorkstations, usersWithWorkstations) ||
                const DeepCollectionEquality().equals(
                    other.usersWithWorkstations, usersWithWorkstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(usersWithWorkstations);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    @required TResult loadFailure(String errorMessage),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(usersWithWorkstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(usersWithWorkstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements WorkstationWatcherState {
  const factory _LoadSuccess(List<UserWithWorkstation> usersWithWorkstations) =
      _$_LoadSuccess;

  List<UserWithWorkstation> get usersWithWorkstations;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$WorkstationWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object errorMessage = freezed,
  }) {
    return _then(_LoadFailure(
      errorMessage == freezed ? _value.errorMessage : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.errorMessage) : assert(errorMessage != null);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'WorkstationWatcherState.loadFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required
        TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    @required TResult loadFailure(String errorMessage),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<UserWithWorkstation> usersWithWorkstations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements WorkstationWatcherState {
  const factory _LoadFailure(String errorMessage) = _$_LoadFailure;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
