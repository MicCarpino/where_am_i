// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'my_presences_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MyPresencesActorEventTearOff {
  const _$MyPresencesActorEventTearOff();

// ignore: unused_element
  _Added added(DateTime date) {
    return _Added(
      date,
    );
  }

// ignore: unused_element
  _Removed removed(int idWorkstation) {
    return _Removed(
      idWorkstation,
    );
  }

// ignore: unused_element
  _Updated updated(Workstation workstation) {
    return _Updated(
      workstation,
    );
  }

// ignore: unused_element
  _EditRequested editRequested(DateTime day, [Workstation workstation]) {
    return _EditRequested(
      day,
      workstation,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MyPresencesActorEvent = _$MyPresencesActorEventTearOff();

/// @nodoc
mixin _$MyPresencesActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(DateTime date),
    @required TResult removed(int idWorkstation),
    @required TResult updated(Workstation workstation),
    @required TResult editRequested(DateTime day, Workstation workstation),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(DateTime date),
    TResult removed(int idWorkstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MyPresencesActorEventCopyWith<$Res> {
  factory $MyPresencesActorEventCopyWith(MyPresencesActorEvent value,
          $Res Function(MyPresencesActorEvent) then) =
      _$MyPresencesActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyPresencesActorEventCopyWithImpl<$Res>
    implements $MyPresencesActorEventCopyWith<$Res> {
  _$MyPresencesActorEventCopyWithImpl(this._value, this._then);

  final MyPresencesActorEvent _value;
  // ignore: unused_field
  final $Res Function(MyPresencesActorEvent) _then;
}

/// @nodoc
abstract class _$AddedCopyWith<$Res> {
  factory _$AddedCopyWith(_Added value, $Res Function(_Added) then) =
      __$AddedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$AddedCopyWithImpl<$Res>
    extends _$MyPresencesActorEventCopyWithImpl<$Res>
    implements _$AddedCopyWith<$Res> {
  __$AddedCopyWithImpl(_Added _value, $Res Function(_Added) _then)
      : super(_value, (v) => _then(v as _Added));

  @override
  _Added get _value => super._value as _Added;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_Added(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_Added implements _Added {
  const _$_Added(this.date) : assert(date != null);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'MyPresencesActorEvent.added(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Added &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$AddedCopyWith<_Added> get copyWith =>
      __$AddedCopyWithImpl<_Added>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(DateTime date),
    @required TResult removed(int idWorkstation),
    @required TResult updated(Workstation workstation),
    @required TResult editRequested(DateTime day, Workstation workstation),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return added(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(DateTime date),
    TResult removed(int idWorkstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (added != null) {
      return added(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements MyPresencesActorEvent {
  const factory _Added(DateTime date) = _$_Added;

  DateTime get date;
  @JsonKey(ignore: true)
  _$AddedCopyWith<_Added> get copyWith;
}

/// @nodoc
abstract class _$RemovedCopyWith<$Res> {
  factory _$RemovedCopyWith(_Removed value, $Res Function(_Removed) then) =
      __$RemovedCopyWithImpl<$Res>;
  $Res call({int idWorkstation});
}

/// @nodoc
class __$RemovedCopyWithImpl<$Res>
    extends _$MyPresencesActorEventCopyWithImpl<$Res>
    implements _$RemovedCopyWith<$Res> {
  __$RemovedCopyWithImpl(_Removed _value, $Res Function(_Removed) _then)
      : super(_value, (v) => _then(v as _Removed));

  @override
  _Removed get _value => super._value as _Removed;

  @override
  $Res call({
    Object idWorkstation = freezed,
  }) {
    return _then(_Removed(
      idWorkstation == freezed ? _value.idWorkstation : idWorkstation as int,
    ));
  }
}

/// @nodoc
class _$_Removed implements _Removed {
  const _$_Removed(this.idWorkstation) : assert(idWorkstation != null);

  @override
  final int idWorkstation;

  @override
  String toString() {
    return 'MyPresencesActorEvent.removed(idWorkstation: $idWorkstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Removed &&
            (identical(other.idWorkstation, idWorkstation) ||
                const DeepCollectionEquality()
                    .equals(other.idWorkstation, idWorkstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idWorkstation);

  @JsonKey(ignore: true)
  @override
  _$RemovedCopyWith<_Removed> get copyWith =>
      __$RemovedCopyWithImpl<_Removed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(DateTime date),
    @required TResult removed(int idWorkstation),
    @required TResult updated(Workstation workstation),
    @required TResult editRequested(DateTime day, Workstation workstation),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return removed(idWorkstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(DateTime date),
    TResult removed(int idWorkstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removed != null) {
      return removed(idWorkstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return removed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removed != null) {
      return removed(this);
    }
    return orElse();
  }
}

abstract class _Removed implements MyPresencesActorEvent {
  const factory _Removed(int idWorkstation) = _$_Removed;

  int get idWorkstation;
  @JsonKey(ignore: true)
  _$RemovedCopyWith<_Removed> get copyWith;
}

/// @nodoc
abstract class _$UpdatedCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) then) =
      __$UpdatedCopyWithImpl<$Res>;
  $Res call({Workstation workstation});
}

/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    extends _$MyPresencesActorEventCopyWithImpl<$Res>
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
}

/// @nodoc
class _$_Updated implements _Updated {
  const _$_Updated(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'MyPresencesActorEvent.updated(workstation: $workstation)';
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
    @required TResult added(DateTime date),
    @required TResult removed(int idWorkstation),
    @required TResult updated(Workstation workstation),
    @required TResult editRequested(DateTime day, Workstation workstation),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return updated(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(DateTime date),
    TResult removed(int idWorkstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements MyPresencesActorEvent {
  const factory _Updated(Workstation workstation) = _$_Updated;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$UpdatedCopyWith<_Updated> get copyWith;
}

/// @nodoc
abstract class _$EditRequestedCopyWith<$Res> {
  factory _$EditRequestedCopyWith(
          _EditRequested value, $Res Function(_EditRequested) then) =
      __$EditRequestedCopyWithImpl<$Res>;
  $Res call({DateTime day, Workstation workstation});
}

/// @nodoc
class __$EditRequestedCopyWithImpl<$Res>
    extends _$MyPresencesActorEventCopyWithImpl<$Res>
    implements _$EditRequestedCopyWith<$Res> {
  __$EditRequestedCopyWithImpl(
      _EditRequested _value, $Res Function(_EditRequested) _then)
      : super(_value, (v) => _then(v as _EditRequested));

  @override
  _EditRequested get _value => super._value as _EditRequested;

  @override
  $Res call({
    Object day = freezed,
    Object workstation = freezed,
  }) {
    return _then(_EditRequested(
      day == freezed ? _value.day : day as DateTime,
      workstation == freezed ? _value.workstation : workstation as Workstation,
    ));
  }
}

/// @nodoc
class _$_EditRequested implements _EditRequested {
  const _$_EditRequested(this.day, [this.workstation]) : assert(day != null);

  @override
  final DateTime day;
  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'MyPresencesActorEvent.editRequested(day: $day, workstation: $workstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditRequested &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(workstation);

  @JsonKey(ignore: true)
  @override
  _$EditRequestedCopyWith<_EditRequested> get copyWith =>
      __$EditRequestedCopyWithImpl<_EditRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(DateTime date),
    @required TResult removed(int idWorkstation),
    @required TResult updated(Workstation workstation),
    @required TResult editRequested(DateTime day, Workstation workstation),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return editRequested(day, workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(DateTime date),
    TResult removed(int idWorkstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editRequested != null) {
      return editRequested(day, workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return editRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editRequested != null) {
      return editRequested(this);
    }
    return orElse();
  }
}

abstract class _EditRequested implements MyPresencesActorEvent {
  const factory _EditRequested(DateTime day, [Workstation workstation]) =
      _$_EditRequested;

  DateTime get day;
  Workstation get workstation;
  @JsonKey(ignore: true)
  _$EditRequestedCopyWith<_EditRequested> get copyWith;
}

/// @nodoc
class _$MyPresencesActorStateTearOff {
  const _$MyPresencesActorStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ActionInProgress actionInProgress() {
    return const _ActionInProgress();
  }

// ignore: unused_element
  _InsertSuccess insertSuccess(Workstation workstation) {
    return _InsertSuccess(
      workstation,
    );
  }

// ignore: unused_element
  _InsertFailure insertFailure(Failure failure) {
    return _InsertFailure(
      failure,
    );
  }

// ignore: unused_element
  _DeleteSuccess deleteSuccess(int idWorkstation) {
    return _DeleteSuccess(
      idWorkstation,
    );
  }

// ignore: unused_element
  _DeleteFailure deleteFailure(Failure failure) {
    return _DeleteFailure(
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
  _UpdateFailure updateFailure(Failure failure) {
    return _UpdateFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MyPresencesActorState = _$MyPresencesActorStateTearOff();

/// @nodoc
mixin _$MyPresencesActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MyPresencesActorStateCopyWith<$Res> {
  factory $MyPresencesActorStateCopyWith(MyPresencesActorState value,
          $Res Function(MyPresencesActorState) then) =
      _$MyPresencesActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MyPresencesActorStateCopyWithImpl<$Res>
    implements $MyPresencesActorStateCopyWith<$Res> {
  _$MyPresencesActorStateCopyWithImpl(this._value, this._then);

  final MyPresencesActorState _value;
  // ignore: unused_field
  final $Res Function(MyPresencesActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
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
    return 'MyPresencesActorState.initial()';
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
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
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

abstract class _Initial implements MyPresencesActorState {
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
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
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
    return 'MyPresencesActorState.actionInProgress()';
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
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
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

abstract class _ActionInProgress implements MyPresencesActorState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$InsertSuccessCopyWith<$Res> {
  factory _$InsertSuccessCopyWith(
          _InsertSuccess value, $Res Function(_InsertSuccess) then) =
      __$InsertSuccessCopyWithImpl<$Res>;
  $Res call({Workstation workstation});
}

/// @nodoc
class __$InsertSuccessCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
    implements _$InsertSuccessCopyWith<$Res> {
  __$InsertSuccessCopyWithImpl(
      _InsertSuccess _value, $Res Function(_InsertSuccess) _then)
      : super(_value, (v) => _then(v as _InsertSuccess));

  @override
  _InsertSuccess get _value => super._value as _InsertSuccess;

  @override
  $Res call({
    Object workstation = freezed,
  }) {
    return _then(_InsertSuccess(
      workstation == freezed ? _value.workstation : workstation as Workstation,
    ));
  }
}

/// @nodoc
class _$_InsertSuccess implements _InsertSuccess {
  const _$_InsertSuccess(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'MyPresencesActorState.insertSuccess(workstation: $workstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InsertSuccess &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstation);

  @JsonKey(ignore: true)
  @override
  _$InsertSuccessCopyWith<_InsertSuccess> get copyWith =>
      __$InsertSuccessCopyWithImpl<_InsertSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return insertSuccess(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertSuccess != null) {
      return insertSuccess(workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return insertSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertSuccess != null) {
      return insertSuccess(this);
    }
    return orElse();
  }
}

abstract class _InsertSuccess implements MyPresencesActorState {
  const factory _InsertSuccess(Workstation workstation) = _$_InsertSuccess;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$InsertSuccessCopyWith<_InsertSuccess> get copyWith;
}

/// @nodoc
abstract class _$InsertFailureCopyWith<$Res> {
  factory _$InsertFailureCopyWith(
          _InsertFailure value, $Res Function(_InsertFailure) then) =
      __$InsertFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$InsertFailureCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
    implements _$InsertFailureCopyWith<$Res> {
  __$InsertFailureCopyWithImpl(
      _InsertFailure _value, $Res Function(_InsertFailure) _then)
      : super(_value, (v) => _then(v as _InsertFailure));

  @override
  _InsertFailure get _value => super._value as _InsertFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_InsertFailure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_InsertFailure implements _InsertFailure {
  const _$_InsertFailure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'MyPresencesActorState.insertFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InsertFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$InsertFailureCopyWith<_InsertFailure> get copyWith =>
      __$InsertFailureCopyWithImpl<_InsertFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return insertFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertFailure != null) {
      return insertFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return insertFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertFailure != null) {
      return insertFailure(this);
    }
    return orElse();
  }
}

abstract class _InsertFailure implements MyPresencesActorState {
  const factory _InsertFailure(Failure failure) = _$_InsertFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$InsertFailureCopyWith<_InsertFailure> get copyWith;
}

/// @nodoc
abstract class _$DeleteSuccessCopyWith<$Res> {
  factory _$DeleteSuccessCopyWith(
          _DeleteSuccess value, $Res Function(_DeleteSuccess) then) =
      __$DeleteSuccessCopyWithImpl<$Res>;
  $Res call({int idWorkstation});
}

/// @nodoc
class __$DeleteSuccessCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
    implements _$DeleteSuccessCopyWith<$Res> {
  __$DeleteSuccessCopyWithImpl(
      _DeleteSuccess _value, $Res Function(_DeleteSuccess) _then)
      : super(_value, (v) => _then(v as _DeleteSuccess));

  @override
  _DeleteSuccess get _value => super._value as _DeleteSuccess;

  @override
  $Res call({
    Object idWorkstation = freezed,
  }) {
    return _then(_DeleteSuccess(
      idWorkstation == freezed ? _value.idWorkstation : idWorkstation as int,
    ));
  }
}

/// @nodoc
class _$_DeleteSuccess implements _DeleteSuccess {
  const _$_DeleteSuccess(this.idWorkstation) : assert(idWorkstation != null);

  @override
  final int idWorkstation;

  @override
  String toString() {
    return 'MyPresencesActorState.deleteSuccess(idWorkstation: $idWorkstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteSuccess &&
            (identical(other.idWorkstation, idWorkstation) ||
                const DeepCollectionEquality()
                    .equals(other.idWorkstation, idWorkstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idWorkstation);

  @JsonKey(ignore: true)
  @override
  _$DeleteSuccessCopyWith<_DeleteSuccess> get copyWith =>
      __$DeleteSuccessCopyWithImpl<_DeleteSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return deleteSuccess(idWorkstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(idWorkstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements MyPresencesActorState {
  const factory _DeleteSuccess(int idWorkstation) = _$_DeleteSuccess;

  int get idWorkstation;
  @JsonKey(ignore: true)
  _$DeleteSuccessCopyWith<_DeleteSuccess> get copyWith;
}

/// @nodoc
abstract class _$DeleteFailureCopyWith<$Res> {
  factory _$DeleteFailureCopyWith(
          _DeleteFailure value, $Res Function(_DeleteFailure) then) =
      __$DeleteFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$DeleteFailureCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
    implements _$DeleteFailureCopyWith<$Res> {
  __$DeleteFailureCopyWithImpl(
      _DeleteFailure _value, $Res Function(_DeleteFailure) _then)
      : super(_value, (v) => _then(v as _DeleteFailure));

  @override
  _DeleteFailure get _value => super._value as _DeleteFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_DeleteFailure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_DeleteFailure implements _DeleteFailure {
  const _$_DeleteFailure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'MyPresencesActorState.deleteFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$DeleteFailureCopyWith<_DeleteFailure> get copyWith =>
      __$DeleteFailureCopyWithImpl<_DeleteFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return deleteFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return deleteFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult updateFailure(_UpdateFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteFailure implements MyPresencesActorState {
  const factory _DeleteFailure(Failure failure) = _$_DeleteFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$DeleteFailureCopyWith<_DeleteFailure> get copyWith;
}

/// @nodoc
abstract class _$UpdateSuccessCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(
          _UpdateSuccess value, $Res Function(_UpdateSuccess) then) =
      __$UpdateSuccessCopyWithImpl<$Res>;
  $Res call({Workstation workstation});
}

/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
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
}

/// @nodoc
class _$_UpdateSuccess implements _UpdateSuccess {
  const _$_UpdateSuccess(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'MyPresencesActorState.updateSuccess(workstation: $workstation)';
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
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateSuccess(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
    TResult updateFailure(Failure failure),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
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

abstract class _UpdateSuccess implements MyPresencesActorState {
  const factory _UpdateSuccess(Workstation workstation) = _$_UpdateSuccess;

  Workstation get workstation;
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
    extends _$MyPresencesActorStateCopyWithImpl<$Res>
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
    return 'MyPresencesActorState.updateFailure(failure: $failure)';
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
    @required TResult insertSuccess(Workstation workstation),
    @required TResult insertFailure(Failure failure),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult deleteFailure(Failure failure),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult updateFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult insertFailure(Failure failure),
    TResult deleteSuccess(int idWorkstation),
    TResult deleteFailure(Failure failure),
    TResult updateSuccess(Workstation workstation),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult insertFailure(_InsertFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult updateFailure(_UpdateFailure value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(insertFailure != null);
    assert(deleteSuccess != null);
    assert(deleteFailure != null);
    assert(updateSuccess != null);
    assert(updateFailure != null);
    return updateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult insertFailure(_InsertFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult deleteFailure(_DeleteFailure value),
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

abstract class _UpdateFailure implements MyPresencesActorState {
  const factory _UpdateFailure(Failure failure) = _$_UpdateFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$UpdateFailureCopyWith<_UpdateFailure> get copyWith;
}
