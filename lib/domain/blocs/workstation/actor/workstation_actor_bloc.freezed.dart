// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WorkstationActorEventTearOff {
  const _$WorkstationActorEventTearOff();

// ignore: unused_element
  _Updated update(Workstation workstation) {
    return _Updated(
      workstation,
    );
  }

// ignore: unused_element
  _MultipleUpdates multipleUpdates(List<Workstation> updatedWorkstations) {
    return _MultipleUpdates(
      updatedWorkstations,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationActorEvent = _$WorkstationActorEventTearOff();

/// @nodoc
mixin _$WorkstationActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(Workstation workstation),
    @required TResult multipleUpdates(List<Workstation> updatedWorkstations),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(Workstation workstation),
    TResult multipleUpdates(List<Workstation> updatedWorkstations),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_Updated value),
    @required TResult multipleUpdates(_MultipleUpdates value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_Updated value),
    TResult multipleUpdates(_MultipleUpdates value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $WorkstationActorEventCopyWith<$Res> {
  factory $WorkstationActorEventCopyWith(WorkstationActorEvent value,
          $Res Function(WorkstationActorEvent) then) =
      _$WorkstationActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkstationActorEventCopyWithImpl<$Res>
    implements $WorkstationActorEventCopyWith<$Res> {
  _$WorkstationActorEventCopyWithImpl(this._value, this._then);

  final WorkstationActorEvent _value;
  // ignore: unused_field
  final $Res Function(WorkstationActorEvent) _then;
}

/// @nodoc
abstract class _$UpdatedCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) then) =
      __$UpdatedCopyWithImpl<$Res>;
  $Res call({Workstation workstation});

  $WorkstationCopyWith<$Res> get workstation;
}

/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    extends _$WorkstationActorEventCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(_Updated _value, $Res Function(_Updated) _then)
      : super(_value, (v) => _then(v as _Updated));

  @override
  _Updated get _value => super._value as _Updated;

  @override
  $Res call({
    Object workstation = freezed,
  }) {
    return _then(_Updated(
      workstation == freezed ? _value.workstation : workstation as Workstation,
    ));
  }

  @override
  $WorkstationCopyWith<$Res> get workstation {
    if (_value.workstation == null) {
      return null;
    }
    return $WorkstationCopyWith<$Res>(_value.workstation, (value) {
      return _then(_value.copyWith(workstation: value));
    });
  }
}

/// @nodoc
class _$_Updated implements _Updated {
  const _$_Updated(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'WorkstationActorEvent.update(workstation: $workstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Updated &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstation);

  @JsonKey(ignore: true)
  @override
  _$UpdatedCopyWith<_Updated> get copyWith =>
      __$UpdatedCopyWithImpl<_Updated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(Workstation workstation),
    @required TResult multipleUpdates(List<Workstation> updatedWorkstations),
  }) {
    assert(update != null);
    assert(multipleUpdates != null);
    return update(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(Workstation workstation),
    TResult multipleUpdates(List<Workstation> updatedWorkstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_Updated value),
    @required TResult multipleUpdates(_MultipleUpdates value),
  }) {
    assert(update != null);
    assert(multipleUpdates != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_Updated value),
    TResult multipleUpdates(_MultipleUpdates value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Updated implements WorkstationActorEvent {
  const factory _Updated(Workstation workstation) = _$_Updated;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$UpdatedCopyWith<_Updated> get copyWith;
}

/// @nodoc
abstract class _$MultipleUpdatesCopyWith<$Res> {
  factory _$MultipleUpdatesCopyWith(
          _MultipleUpdates value, $Res Function(_MultipleUpdates) then) =
      __$MultipleUpdatesCopyWithImpl<$Res>;
  $Res call({List<Workstation> updatedWorkstations});
}

/// @nodoc
class __$MultipleUpdatesCopyWithImpl<$Res>
    extends _$WorkstationActorEventCopyWithImpl<$Res>
    implements _$MultipleUpdatesCopyWith<$Res> {
  __$MultipleUpdatesCopyWithImpl(
      _MultipleUpdates _value, $Res Function(_MultipleUpdates) _then)
      : super(_value, (v) => _then(v as _MultipleUpdates));

  @override
  _MultipleUpdates get _value => super._value as _MultipleUpdates;

  @override
  $Res call({
    Object updatedWorkstations = freezed,
  }) {
    return _then(_MultipleUpdates(
      updatedWorkstations == freezed
          ? _value.updatedWorkstations
          : updatedWorkstations as List<Workstation>,
    ));
  }
}

/// @nodoc
class _$_MultipleUpdates implements _MultipleUpdates {
  const _$_MultipleUpdates(this.updatedWorkstations)
      : assert(updatedWorkstations != null);

  @override
  final List<Workstation> updatedWorkstations;

  @override
  String toString() {
    return 'WorkstationActorEvent.multipleUpdates(updatedWorkstations: $updatedWorkstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MultipleUpdates &&
            (identical(other.updatedWorkstations, updatedWorkstations) ||
                const DeepCollectionEquality()
                    .equals(other.updatedWorkstations, updatedWorkstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(updatedWorkstations);

  @JsonKey(ignore: true)
  @override
  _$MultipleUpdatesCopyWith<_MultipleUpdates> get copyWith =>
      __$MultipleUpdatesCopyWithImpl<_MultipleUpdates>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(Workstation workstation),
    @required TResult multipleUpdates(List<Workstation> updatedWorkstations),
  }) {
    assert(update != null);
    assert(multipleUpdates != null);
    return multipleUpdates(updatedWorkstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(Workstation workstation),
    TResult multipleUpdates(List<Workstation> updatedWorkstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleUpdates != null) {
      return multipleUpdates(updatedWorkstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_Updated value),
    @required TResult multipleUpdates(_MultipleUpdates value),
  }) {
    assert(update != null);
    assert(multipleUpdates != null);
    return multipleUpdates(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_Updated value),
    TResult multipleUpdates(_MultipleUpdates value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleUpdates != null) {
      return multipleUpdates(this);
    }
    return orElse();
  }
}

abstract class _MultipleUpdates implements WorkstationActorEvent {
  const factory _MultipleUpdates(List<Workstation> updatedWorkstations) =
      _$_MultipleUpdates;

  List<Workstation> get updatedWorkstations;
  @JsonKey(ignore: true)
  _$MultipleUpdatesCopyWith<_MultipleUpdates> get copyWith;
}

/// @nodoc
class _$WorkstationActorStateTearOff {
  const _$WorkstationActorStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ActionInProgress actionInProgress() {
    return const _ActionInProgress();
  }

// ignore: unused_element
  _Failure actionFailure(Failure failure) {
    return _Failure(
      failure,
    );
  }

// ignore: unused_element
  _UpdateSuccess updateSuccess(Workstation workstation) {
    return _UpdateSuccess(
      workstation,
    );
  }

// ignore: unused_element
  _MultipleUpdateSuccess multipleUpdateSuccess(List<Workstation> workstations) {
    return _MultipleUpdateSuccess(
      workstations,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationActorState = _$WorkstationActorStateTearOff();

/// @nodoc
mixin _$WorkstationActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $WorkstationActorStateCopyWith<$Res> {
  factory $WorkstationActorStateCopyWith(WorkstationActorState value,
          $Res Function(WorkstationActorState) then) =
      _$WorkstationActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkstationActorStateCopyWithImpl<$Res>
    implements $WorkstationActorStateCopyWith<$Res> {
  _$WorkstationActorStateCopyWithImpl(this._value, this._then);

  final WorkstationActorState _value;
  // ignore: unused_field
  final $Res Function(WorkstationActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$WorkstationActorStateCopyWithImpl<$Res>
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
    return 'WorkstationActorState.initial()';
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
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
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
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WorkstationActorState {
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
    extends _$WorkstationActorStateCopyWithImpl<$Res>
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
    return 'WorkstationActorState.actionInProgress()';
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
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
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
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements WorkstationActorState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$WorkstationActorStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_Failure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_Failure implements _Failure {
  const _$_Failure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'WorkstationActorState.actionFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return actionFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionFailure != null) {
      return actionFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return actionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionFailure != null) {
      return actionFailure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements WorkstationActorState {
  const factory _Failure(Failure failure) = _$_Failure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith;
}

/// @nodoc
abstract class _$UpdateSuccessCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(
          _UpdateSuccess value, $Res Function(_UpdateSuccess) then) =
      __$UpdateSuccessCopyWithImpl<$Res>;
  $Res call({Workstation workstation});

  $WorkstationCopyWith<$Res> get workstation;
}

/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    extends _$WorkstationActorStateCopyWithImpl<$Res>
    implements _$UpdateSuccessCopyWith<$Res> {
  __$UpdateSuccessCopyWithImpl(
      _UpdateSuccess _value, $Res Function(_UpdateSuccess) _then)
      : super(_value, (v) => _then(v as _UpdateSuccess));

  @override
  _UpdateSuccess get _value => super._value as _UpdateSuccess;

  @override
  $Res call({
    Object workstation = freezed,
  }) {
    return _then(_UpdateSuccess(
      workstation == freezed ? _value.workstation : workstation as Workstation,
    ));
  }

  @override
  $WorkstationCopyWith<$Res> get workstation {
    if (_value.workstation == null) {
      return null;
    }
    return $WorkstationCopyWith<$Res>(_value.workstation, (value) {
      return _then(_value.copyWith(workstation: value));
    });
  }
}

/// @nodoc
class _$_UpdateSuccess implements _UpdateSuccess {
  const _$_UpdateSuccess(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'WorkstationActorState.updateSuccess(workstation: $workstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateSuccess &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstation);

  @JsonKey(ignore: true)
  @override
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith =>
      __$UpdateSuccessCopyWithImpl<_UpdateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return updateSuccess(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements WorkstationActorState {
  const factory _UpdateSuccess(Workstation workstation) = _$_UpdateSuccess;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith;
}

/// @nodoc
abstract class _$MultipleUpdateSuccessCopyWith<$Res> {
  factory _$MultipleUpdateSuccessCopyWith(_MultipleUpdateSuccess value,
          $Res Function(_MultipleUpdateSuccess) then) =
      __$MultipleUpdateSuccessCopyWithImpl<$Res>;
  $Res call({List<Workstation> workstations});
}

/// @nodoc
class __$MultipleUpdateSuccessCopyWithImpl<$Res>
    extends _$WorkstationActorStateCopyWithImpl<$Res>
    implements _$MultipleUpdateSuccessCopyWith<$Res> {
  __$MultipleUpdateSuccessCopyWithImpl(_MultipleUpdateSuccess _value,
      $Res Function(_MultipleUpdateSuccess) _then)
      : super(_value, (v) => _then(v as _MultipleUpdateSuccess));

  @override
  _MultipleUpdateSuccess get _value => super._value as _MultipleUpdateSuccess;

  @override
  $Res call({
    Object workstations = freezed,
  }) {
    return _then(_MultipleUpdateSuccess(
      workstations == freezed
          ? _value.workstations
          : workstations as List<Workstation>,
    ));
  }
}

/// @nodoc
class _$_MultipleUpdateSuccess implements _MultipleUpdateSuccess {
  const _$_MultipleUpdateSuccess(this.workstations)
      : assert(workstations != null);

  @override
  final List<Workstation> workstations;

  @override
  String toString() {
    return 'WorkstationActorState.multipleUpdateSuccess(workstations: $workstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MultipleUpdateSuccess &&
            (identical(other.workstations, workstations) ||
                const DeepCollectionEquality()
                    .equals(other.workstations, workstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstations);

  @JsonKey(ignore: true)
  @override
  _$MultipleUpdateSuccessCopyWith<_MultipleUpdateSuccess> get copyWith =>
      __$MultipleUpdateSuccessCopyWithImpl<_MultipleUpdateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult multipleUpdateSuccess(List<Workstation> workstations),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return multipleUpdateSuccess(workstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult multipleUpdateSuccess(List<Workstation> workstations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleUpdateSuccess != null) {
      return multipleUpdateSuccess(workstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_Failure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    assert(updateSuccess != null);
    assert(multipleUpdateSuccess != null);
    return multipleUpdateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_Failure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult multipleUpdateSuccess(_MultipleUpdateSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleUpdateSuccess != null) {
      return multipleUpdateSuccess(this);
    }
    return orElse();
  }
}

abstract class _MultipleUpdateSuccess implements WorkstationActorState {
  const factory _MultipleUpdateSuccess(List<Workstation> workstations) =
      _$_MultipleUpdateSuccess;

  List<Workstation> get workstations;
  @JsonKey(ignore: true)
  _$MultipleUpdateSuccessCopyWith<_MultipleUpdateSuccess> get copyWith;
}
