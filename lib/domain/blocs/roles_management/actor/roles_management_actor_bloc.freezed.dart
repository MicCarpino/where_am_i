// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'roles_management_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RolesManagementActorEventTearOff {
  const _$RolesManagementActorEventTearOff();

// ignore: unused_element
  _OnRoleUpdate onRoleUpdate(User user, int newRoleId) {
    return _OnRoleUpdate(
      user,
      newRoleId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RolesManagementActorEvent = _$RolesManagementActorEventTearOff();

/// @nodoc
mixin _$RolesManagementActorEvent {
  User get user;
  int get newRoleId;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult onRoleUpdate(User user, int newRoleId),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onRoleUpdate(User user, int newRoleId),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onRoleUpdate(_OnRoleUpdate value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onRoleUpdate(_OnRoleUpdate value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $RolesManagementActorEventCopyWith<RolesManagementActorEvent> get copyWith;
}

/// @nodoc
abstract class $RolesManagementActorEventCopyWith<$Res> {
  factory $RolesManagementActorEventCopyWith(RolesManagementActorEvent value,
          $Res Function(RolesManagementActorEvent) then) =
      _$RolesManagementActorEventCopyWithImpl<$Res>;
  $Res call({User user, int newRoleId});
}

/// @nodoc
class _$RolesManagementActorEventCopyWithImpl<$Res>
    implements $RolesManagementActorEventCopyWith<$Res> {
  _$RolesManagementActorEventCopyWithImpl(this._value, this._then);

  final RolesManagementActorEvent _value;
  // ignore: unused_field
  final $Res Function(RolesManagementActorEvent) _then;

  @override
  $Res call({
    Object user = freezed,
    Object newRoleId = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed ? _value.user : user as User,
      newRoleId: newRoleId == freezed ? _value.newRoleId : newRoleId as int,
    ));
  }
}

/// @nodoc
abstract class _$OnRoleUpdateCopyWith<$Res>
    implements $RolesManagementActorEventCopyWith<$Res> {
  factory _$OnRoleUpdateCopyWith(
          _OnRoleUpdate value, $Res Function(_OnRoleUpdate) then) =
      __$OnRoleUpdateCopyWithImpl<$Res>;
  @override
  $Res call({User user, int newRoleId});
}

/// @nodoc
class __$OnRoleUpdateCopyWithImpl<$Res>
    extends _$RolesManagementActorEventCopyWithImpl<$Res>
    implements _$OnRoleUpdateCopyWith<$Res> {
  __$OnRoleUpdateCopyWithImpl(
      _OnRoleUpdate _value, $Res Function(_OnRoleUpdate) _then)
      : super(_value, (v) => _then(v as _OnRoleUpdate));

  @override
  _OnRoleUpdate get _value => super._value as _OnRoleUpdate;

  @override
  $Res call({
    Object user = freezed,
    Object newRoleId = freezed,
  }) {
    return _then(_OnRoleUpdate(
      user == freezed ? _value.user : user as User,
      newRoleId == freezed ? _value.newRoleId : newRoleId as int,
    ));
  }
}

/// @nodoc
class _$_OnRoleUpdate implements _OnRoleUpdate {
  const _$_OnRoleUpdate(this.user, this.newRoleId)
      : assert(user != null),
        assert(newRoleId != null);

  @override
  final User user;
  @override
  final int newRoleId;

  @override
  String toString() {
    return 'RolesManagementActorEvent.onRoleUpdate(user: $user, newRoleId: $newRoleId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnRoleUpdate &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.newRoleId, newRoleId) ||
                const DeepCollectionEquality()
                    .equals(other.newRoleId, newRoleId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(newRoleId);

  @JsonKey(ignore: true)
  @override
  _$OnRoleUpdateCopyWith<_OnRoleUpdate> get copyWith =>
      __$OnRoleUpdateCopyWithImpl<_OnRoleUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult onRoleUpdate(User user, int newRoleId),
  }) {
    assert(onRoleUpdate != null);
    return onRoleUpdate(user, newRoleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult onRoleUpdate(User user, int newRoleId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onRoleUpdate != null) {
      return onRoleUpdate(user, newRoleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult onRoleUpdate(_OnRoleUpdate value),
  }) {
    assert(onRoleUpdate != null);
    return onRoleUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult onRoleUpdate(_OnRoleUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onRoleUpdate != null) {
      return onRoleUpdate(this);
    }
    return orElse();
  }
}

abstract class _OnRoleUpdate implements RolesManagementActorEvent {
  const factory _OnRoleUpdate(User user, int newRoleId) = _$_OnRoleUpdate;

  @override
  User get user;
  @override
  int get newRoleId;
  @override
  @JsonKey(ignore: true)
  _$OnRoleUpdateCopyWith<_OnRoleUpdate> get copyWith;
}

/// @nodoc
class _$RolesManagementActorStateTearOff {
  const _$RolesManagementActorStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ActionInProgress actionInProgress() {
    return const _ActionInProgress();
  }

// ignore: unused_element
  _UpdateSuccess updateSuccess(User user) {
    return _UpdateSuccess(
      user,
    );
  }

// ignore: unused_element
  _UpdateFailure updateFailure(Failure failure) {
    return _UpdateFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RolesManagementActorState = _$RolesManagementActorStateTearOff();

/// @nodoc
mixin _$RolesManagementActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult updateSuccess(User user),
    @required TResult updateFailure(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult updateSuccess(User user),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RolesManagementActorStateCopyWith<$Res> {
  factory $RolesManagementActorStateCopyWith(RolesManagementActorState value,
          $Res Function(RolesManagementActorState) then) =
      _$RolesManagementActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RolesManagementActorStateCopyWithImpl<$Res>
    implements $RolesManagementActorStateCopyWith<$Res> {
  _$RolesManagementActorStateCopyWithImpl(this._value, this._then);

  final RolesManagementActorState _value;
  // ignore: unused_field
  final $Res Function(RolesManagementActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$RolesManagementActorStateCopyWithImpl<$Res>
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
    return 'RolesManagementActorState.initial()';
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
    @required TResult actionInProgress(),
    @required TResult updateSuccess(User user),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult updateSuccess(User user),
    TResult updateFailure(Failure failure),
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
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RolesManagementActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ActionInProgressCopyWith<$Res> {
  factory _$ActionInProgressCopyWith(
          _ActionInProgress value, $Res Function(_ActionInProgress) then) =
      __$ActionInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$ActionInProgressCopyWithImpl<$Res>
    extends _$RolesManagementActorStateCopyWithImpl<$Res>
    implements _$ActionInProgressCopyWith<$Res> {
  __$ActionInProgressCopyWithImpl(
      _ActionInProgress _value, $Res Function(_ActionInProgress) _then)
      : super(_value, (v) => _then(v as _ActionInProgress));

  @override
  _ActionInProgress get _value => super._value as _ActionInProgress;
}

/// @nodoc
class _$_ActionInProgress implements _ActionInProgress {
  const _$_ActionInProgress();

  @override
  String toString() {
    return 'RolesManagementActorState.actionInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ActionInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult updateSuccess(User user),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult updateSuccess(User user),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements RolesManagementActorState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$UpdateSuccessCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(
          _UpdateSuccess value, $Res Function(_UpdateSuccess) then) =
      __$UpdateSuccessCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    extends _$RolesManagementActorStateCopyWithImpl<$Res>
    implements _$UpdateSuccessCopyWith<$Res> {
  __$UpdateSuccessCopyWithImpl(
      _UpdateSuccess _value, $Res Function(_UpdateSuccess) _then)
      : super(_value, (v) => _then(v as _UpdateSuccess));

  @override
  _UpdateSuccess get _value => super._value as _UpdateSuccess;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_UpdateSuccess(
      user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$_UpdateSuccess implements _UpdateSuccess {
  const _$_UpdateSuccess(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'RolesManagementActorState.updateSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateSuccess &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith =>
      __$UpdateSuccessCopyWithImpl<_UpdateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult updateSuccess(User user),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult updateSuccess(User user),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements RolesManagementActorState {
  const factory _UpdateSuccess(User user) = _$_UpdateSuccess;

  User get user;
  @JsonKey(ignore: true)
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith;
}

/// @nodoc
abstract class _$UpdateFailureCopyWith<$Res> {
  factory _$UpdateFailureCopyWith(
          _UpdateFailure value, $Res Function(_UpdateFailure) then) =
      __$UpdateFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$UpdateFailureCopyWithImpl<$Res>
    extends _$RolesManagementActorStateCopyWithImpl<$Res>
    implements _$UpdateFailureCopyWith<$Res> {
  __$UpdateFailureCopyWithImpl(
      _UpdateFailure _value, $Res Function(_UpdateFailure) _then)
      : super(_value, (v) => _then(v as _UpdateFailure));

  @override
  _UpdateFailure get _value => super._value as _UpdateFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_UpdateFailure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_UpdateFailure implements _UpdateFailure {
  const _$_UpdateFailure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'RolesManagementActorState.updateFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$UpdateFailureCopyWith<_UpdateFailure> get copyWith =>
      __$UpdateFailureCopyWithImpl<_UpdateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult updateSuccess(User user),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult updateSuccess(User user),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateFailure != null) {
      return updateFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateFailure != null) {
      return updateFailure(this);
    }
    return orElse();
  }
}

abstract class _UpdateFailure implements RolesManagementActorState {
  const factory _UpdateFailure(Failure failure) = _$_UpdateFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$UpdateFailureCopyWith<_UpdateFailure> get copyWith;
}
