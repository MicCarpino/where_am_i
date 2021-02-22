// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'my_presences_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MyPresencesWatcherEventTearOff {
  const _$MyPresencesWatcherEventTearOff();

// ignore: unused_element
  _GetUserPresences getUserPresences() {
    return const _GetUserPresences();
  }

// ignore: unused_element
  _WorkstationsReceived workstationsReceived() {
    return const _WorkstationsReceived();
  }
}

/// @nodoc
// ignore: unused_element
const $MyPresencesWatcherEvent = _$MyPresencesWatcherEventTearOff();

/// @nodoc
mixin _$MyPresencesWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getUserPresences(),
    @required TResult workstationsReceived(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getUserPresences(),
    TResult workstationsReceived(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getUserPresences(_GetUserPresences value),
    @required TResult workstationsReceived(_WorkstationsReceived value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getUserPresences(_GetUserPresences value),
    TResult workstationsReceived(_WorkstationsReceived value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MyPresencesWatcherEventCopyWith<$Res> {
  factory $MyPresencesWatcherEventCopyWith(MyPresencesWatcherEvent value,
          $Res Function(MyPresencesWatcherEvent) then) =
      _$MyPresencesWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyPresencesWatcherEventCopyWithImpl<$Res>
    implements $MyPresencesWatcherEventCopyWith<$Res> {
  _$MyPresencesWatcherEventCopyWithImpl(this._value, this._then);

  final MyPresencesWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(MyPresencesWatcherEvent) _then;
}

/// @nodoc
abstract class _$GetUserPresencesCopyWith<$Res> {
  factory _$GetUserPresencesCopyWith(
          _GetUserPresences value, $Res Function(_GetUserPresences) then) =
      __$GetUserPresencesCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetUserPresencesCopyWithImpl<$Res>
    extends _$MyPresencesWatcherEventCopyWithImpl<$Res>
    implements _$GetUserPresencesCopyWith<$Res> {
  __$GetUserPresencesCopyWithImpl(
      _GetUserPresences _value, $Res Function(_GetUserPresences) _then)
      : super(_value, (v) => _then(v as _GetUserPresences));

  @override
  _GetUserPresences get _value => super._value as _GetUserPresences;
}

/// @nodoc
class _$_GetUserPresences implements _GetUserPresences {
  const _$_GetUserPresences();

  @override
  String toString() {
    return 'MyPresencesWatcherEvent.getUserPresences()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetUserPresences);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getUserPresences(),
    @required TResult workstationsReceived(),
  }) {
    assert(getUserPresences != null);
    assert(workstationsReceived != null);
    return getUserPresences();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getUserPresences(),
    TResult workstationsReceived(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getUserPresences != null) {
      return getUserPresences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getUserPresences(_GetUserPresences value),
    @required TResult workstationsReceived(_WorkstationsReceived value),
  }) {
    assert(getUserPresences != null);
    assert(workstationsReceived != null);
    return getUserPresences(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getUserPresences(_GetUserPresences value),
    TResult workstationsReceived(_WorkstationsReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (getUserPresences != null) {
      return getUserPresences(this);
    }
    return orElse();
  }
}

abstract class _GetUserPresences implements MyPresencesWatcherEvent {
  const factory _GetUserPresences() = _$_GetUserPresences;
}

/// @nodoc
abstract class _$WorkstationsReceivedCopyWith<$Res> {
  factory _$WorkstationsReceivedCopyWith(_WorkstationsReceived value,
          $Res Function(_WorkstationsReceived) then) =
      __$WorkstationsReceivedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WorkstationsReceivedCopyWithImpl<$Res>
    extends _$MyPresencesWatcherEventCopyWithImpl<$Res>
    implements _$WorkstationsReceivedCopyWith<$Res> {
  __$WorkstationsReceivedCopyWithImpl(
      _WorkstationsReceived _value, $Res Function(_WorkstationsReceived) _then)
      : super(_value, (v) => _then(v as _WorkstationsReceived));

  @override
  _WorkstationsReceived get _value => super._value as _WorkstationsReceived;
}

/// @nodoc
class _$_WorkstationsReceived implements _WorkstationsReceived {
  const _$_WorkstationsReceived();

  @override
  String toString() {
    return 'MyPresencesWatcherEvent.workstationsReceived()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WorkstationsReceived);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult getUserPresences(),
    @required TResult workstationsReceived(),
  }) {
    assert(getUserPresences != null);
    assert(workstationsReceived != null);
    return workstationsReceived();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult getUserPresences(),
    TResult workstationsReceived(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (workstationsReceived != null) {
      return workstationsReceived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult getUserPresences(_GetUserPresences value),
    @required TResult workstationsReceived(_WorkstationsReceived value),
  }) {
    assert(getUserPresences != null);
    assert(workstationsReceived != null);
    return workstationsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult getUserPresences(_GetUserPresences value),
    TResult workstationsReceived(_WorkstationsReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (workstationsReceived != null) {
      return workstationsReceived(this);
    }
    return orElse();
  }
}

abstract class _WorkstationsReceived implements MyPresencesWatcherEvent {
  const factory _WorkstationsReceived() = _$_WorkstationsReceived;
}

/// @nodoc
class _$MyPresencesWatcherStateTearOff {
  const _$MyPresencesWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(List<Workstation> presences) {
    return _LoadSuccess(
      presences,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure(Failure failure) {
    return _LoadFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MyPresencesWatcherState = _$MyPresencesWatcherStateTearOff();

/// @nodoc
mixin _$MyPresencesWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<Workstation> presences),
    @required TResult loadFailure(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<Workstation> presences),
    TResult loadFailure(Failure failure),
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
abstract class $MyPresencesWatcherStateCopyWith<$Res> {
  factory $MyPresencesWatcherStateCopyWith(MyPresencesWatcherState value,
          $Res Function(MyPresencesWatcherState) then) =
      _$MyPresencesWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyPresencesWatcherStateCopyWithImpl<$Res>
    implements $MyPresencesWatcherStateCopyWith<$Res> {
  _$MyPresencesWatcherStateCopyWithImpl(this._value, this._then);

  final MyPresencesWatcherState _value;
  // ignore: unused_field
  final $Res Function(MyPresencesWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$MyPresencesWatcherStateCopyWithImpl<$Res>
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
    return 'MyPresencesWatcherState.initial()';
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
    @required TResult loadSuccess(List<Workstation> presences),
    @required TResult loadFailure(Failure failure),
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
    TResult loadSuccess(List<Workstation> presences),
    TResult loadFailure(Failure failure),
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

abstract class _Initial implements MyPresencesWatcherState {
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
    extends _$MyPresencesWatcherStateCopyWithImpl<$Res>
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
    return 'MyPresencesWatcherState.loadInProgress()';
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
    @required TResult loadSuccess(List<Workstation> presences),
    @required TResult loadFailure(Failure failure),
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
    TResult loadSuccess(List<Workstation> presences),
    TResult loadFailure(Failure failure),
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

abstract class _LoadInProgress implements MyPresencesWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Workstation> presences});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$MyPresencesWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object presences = freezed,
  }) {
    return _then(_LoadSuccess(
      presences == freezed ? _value.presences : presences as List<Workstation>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.presences) : assert(presences != null);

  @override
  final List<Workstation> presences;

  @override
  String toString() {
    return 'MyPresencesWatcherState.loadSuccess(presences: $presences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.presences, presences) ||
                const DeepCollectionEquality()
                    .equals(other.presences, presences)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(presences);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<Workstation> presences),
    @required TResult loadFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(presences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<Workstation> presences),
    TResult loadFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(presences);
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

abstract class _LoadSuccess implements MyPresencesWatcherState {
  const factory _LoadSuccess(List<Workstation> presences) = _$_LoadSuccess;

  List<Workstation> get presences;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$MyPresencesWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_LoadFailure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'MyPresencesWatcherState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<Workstation> presences),
    @required TResult loadFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<Workstation> presences),
    TResult loadFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(failure);
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

abstract class _LoadFailure implements MyPresencesWatcherState {
  const factory _LoadFailure(Failure failure) = _$_LoadFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
