// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'presences_management_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PresencesManagementActorEventTearOff {
  const _$PresencesManagementActorEventTearOff();

// ignore: unused_element
  _Added added(TimeSlot timeslot, DateTime date) {
    return _Added(
      timeslot,
      date,
    );
  }

// ignore: unused_element
  _AddedMultiple addedMultiple(TimeSlot timeslot, List<DateTime> dates) {
    return _AddedMultiple(
      timeslot,
      dates,
    );
  }

// ignore: unused_element
  _Removed removed(Workstation workstation) {
    return _Removed(
      workstation,
    );
  }

// ignore: unused_element
  _Updated updated(Workstation workstation) {
    return _Updated(
      workstation,
    );
  }

// ignore: unused_element
  _EditRequested editRequested(DateTime day,
      [Workstation workstation, User user]) {
    return _EditRequested(
      day,
      workstation,
      user,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PresencesManagementActorEvent = _$PresencesManagementActorEventTearOff();

/// @nodoc
mixin _$PresencesManagementActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PresencesManagementActorEventCopyWith<$Res> {
  factory $PresencesManagementActorEventCopyWith(
          PresencesManagementActorEvent value,
          $Res Function(PresencesManagementActorEvent) then) =
      _$PresencesManagementActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PresencesManagementActorEventCopyWithImpl<$Res>
    implements $PresencesManagementActorEventCopyWith<$Res> {
  _$PresencesManagementActorEventCopyWithImpl(this._value, this._then);

  final PresencesManagementActorEvent _value;
  // ignore: unused_field
  final $Res Function(PresencesManagementActorEvent) _then;
}

/// @nodoc
abstract class _$AddedCopyWith<$Res> {
  factory _$AddedCopyWith(_Added value, $Res Function(_Added) then) =
      __$AddedCopyWithImpl<$Res>;
  $Res call({TimeSlot timeslot, DateTime date});
}

/// @nodoc
class __$AddedCopyWithImpl<$Res>
    extends _$PresencesManagementActorEventCopyWithImpl<$Res>
    implements _$AddedCopyWith<$Res> {
  __$AddedCopyWithImpl(_Added _value, $Res Function(_Added) _then)
      : super(_value, (v) => _then(v as _Added));

  @override
  _Added get _value => super._value as _Added;

  @override
  $Res call({
    Object timeslot = freezed,
    Object date = freezed,
  }) {
    return _then(_Added(
      timeslot == freezed ? _value.timeslot : timeslot as TimeSlot,
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_Added implements _Added {
  const _$_Added(this.timeslot, this.date)
      : assert(timeslot != null),
        assert(date != null);

  @override
  final TimeSlot timeslot;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'PresencesManagementActorEvent.added(timeslot: $timeslot, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Added &&
            (identical(other.timeslot, timeslot) ||
                const DeepCollectionEquality()
                    .equals(other.timeslot, timeslot)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timeslot) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$AddedCopyWith<_Added> get copyWith =>
      __$AddedCopyWithImpl<_Added>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return added(timeslot, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (added != null) {
      return added(timeslot, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
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

abstract class _Added implements PresencesManagementActorEvent {
  const factory _Added(TimeSlot timeslot, DateTime date) = _$_Added;

  TimeSlot get timeslot;
  DateTime get date;
  @JsonKey(ignore: true)
  _$AddedCopyWith<_Added> get copyWith;
}

/// @nodoc
abstract class _$AddedMultipleCopyWith<$Res> {
  factory _$AddedMultipleCopyWith(
          _AddedMultiple value, $Res Function(_AddedMultiple) then) =
      __$AddedMultipleCopyWithImpl<$Res>;
  $Res call({TimeSlot timeslot, List<DateTime> dates});
}

/// @nodoc
class __$AddedMultipleCopyWithImpl<$Res>
    extends _$PresencesManagementActorEventCopyWithImpl<$Res>
    implements _$AddedMultipleCopyWith<$Res> {
  __$AddedMultipleCopyWithImpl(
      _AddedMultiple _value, $Res Function(_AddedMultiple) _then)
      : super(_value, (v) => _then(v as _AddedMultiple));

  @override
  _AddedMultiple get _value => super._value as _AddedMultiple;

  @override
  $Res call({
    Object timeslot = freezed,
    Object dates = freezed,
  }) {
    return _then(_AddedMultiple(
      timeslot == freezed ? _value.timeslot : timeslot as TimeSlot,
      dates == freezed ? _value.dates : dates as List<DateTime>,
    ));
  }
}

/// @nodoc
class _$_AddedMultiple implements _AddedMultiple {
  const _$_AddedMultiple(this.timeslot, this.dates)
      : assert(timeslot != null),
        assert(dates != null);

  @override
  final TimeSlot timeslot;
  @override
  final List<DateTime> dates;

  @override
  String toString() {
    return 'PresencesManagementActorEvent.addedMultiple(timeslot: $timeslot, dates: $dates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddedMultiple &&
            (identical(other.timeslot, timeslot) ||
                const DeepCollectionEquality()
                    .equals(other.timeslot, timeslot)) &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timeslot) ^
      const DeepCollectionEquality().hash(dates);

  @JsonKey(ignore: true)
  @override
  _$AddedMultipleCopyWith<_AddedMultiple> get copyWith =>
      __$AddedMultipleCopyWithImpl<_AddedMultiple>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return addedMultiple(timeslot, dates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addedMultiple != null) {
      return addedMultiple(timeslot, dates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return addedMultiple(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
    TResult removed(_Removed value),
    TResult updated(_Updated value),
    TResult editRequested(_EditRequested value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addedMultiple != null) {
      return addedMultiple(this);
    }
    return orElse();
  }
}

abstract class _AddedMultiple implements PresencesManagementActorEvent {
  const factory _AddedMultiple(TimeSlot timeslot, List<DateTime> dates) =
      _$_AddedMultiple;

  TimeSlot get timeslot;
  List<DateTime> get dates;
  @JsonKey(ignore: true)
  _$AddedMultipleCopyWith<_AddedMultiple> get copyWith;
}

/// @nodoc
abstract class _$RemovedCopyWith<$Res> {
  factory _$RemovedCopyWith(_Removed value, $Res Function(_Removed) then) =
      __$RemovedCopyWithImpl<$Res>;
  $Res call({Workstation workstation});
}

/// @nodoc
class __$RemovedCopyWithImpl<$Res>
    extends _$PresencesManagementActorEventCopyWithImpl<$Res>
    implements _$RemovedCopyWith<$Res> {
  __$RemovedCopyWithImpl(_Removed _value, $Res Function(_Removed) _then)
      : super(_value, (v) => _then(v as _Removed));

  @override
  _Removed get _value => super._value as _Removed;

  @override
  $Res call({
    Object workstation = freezed,
  }) {
    return _then(_Removed(
      workstation == freezed ? _value.workstation : workstation as Workstation,
    ));
  }
}

/// @nodoc
class _$_Removed implements _Removed {
  const _$_Removed(this.workstation) : assert(workstation != null);

  @override
  final Workstation workstation;

  @override
  String toString() {
    return 'PresencesManagementActorEvent.removed(workstation: $workstation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Removed &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstation);

  @JsonKey(ignore: true)
  @override
  _$RemovedCopyWith<_Removed> get copyWith =>
      __$RemovedCopyWithImpl<_Removed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return removed(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removed != null) {
      return removed(workstation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return removed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
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

abstract class _Removed implements PresencesManagementActorEvent {
  const factory _Removed(Workstation workstation) = _$_Removed;

  Workstation get workstation;
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
    extends _$PresencesManagementActorEventCopyWithImpl<$Res>
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
    return 'PresencesManagementActorEvent.updated(workstation: $workstation)';
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
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return updated(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
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
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
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

abstract class _Updated implements PresencesManagementActorEvent {
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
  $Res call({DateTime day, Workstation workstation, User user});
}

/// @nodoc
class __$EditRequestedCopyWithImpl<$Res>
    extends _$PresencesManagementActorEventCopyWithImpl<$Res>
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
    Object user = freezed,
  }) {
    return _then(_EditRequested(
      day == freezed ? _value.day : day as DateTime,
      workstation == freezed ? _value.workstation : workstation as Workstation,
      user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$_EditRequested implements _EditRequested {
  const _$_EditRequested(this.day, [this.workstation, this.user])
      : assert(day != null);

  @override
  final DateTime day;
  @override
  final Workstation workstation;
  @override
  final User user;

  @override
  String toString() {
    return 'PresencesManagementActorEvent.editRequested(day: $day, workstation: $workstation, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditRequested &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(workstation) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$EditRequestedCopyWith<_EditRequested> get copyWith =>
      __$EditRequestedCopyWithImpl<_EditRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult added(TimeSlot timeslot, DateTime date),
    @required TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    @required TResult removed(Workstation workstation),
    @required TResult updated(Workstation workstation),
    @required
        TResult editRequested(DateTime day, Workstation workstation, User user),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return editRequested(day, workstation, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult added(TimeSlot timeslot, DateTime date),
    TResult addedMultiple(TimeSlot timeslot, List<DateTime> dates),
    TResult removed(Workstation workstation),
    TResult updated(Workstation workstation),
    TResult editRequested(DateTime day, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editRequested != null) {
      return editRequested(day, workstation, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult added(_Added value),
    @required TResult addedMultiple(_AddedMultiple value),
    @required TResult removed(_Removed value),
    @required TResult updated(_Updated value),
    @required TResult editRequested(_EditRequested value),
  }) {
    assert(added != null);
    assert(addedMultiple != null);
    assert(removed != null);
    assert(updated != null);
    assert(editRequested != null);
    return editRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult added(_Added value),
    TResult addedMultiple(_AddedMultiple value),
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

abstract class _EditRequested implements PresencesManagementActorEvent {
  const factory _EditRequested(DateTime day,
      [Workstation workstation, User user]) = _$_EditRequested;

  DateTime get day;
  Workstation get workstation;
  User get user;
  @JsonKey(ignore: true)
  _$EditRequestedCopyWith<_EditRequested> get copyWith;
}

/// @nodoc
class _$PresencesManagementActorStateTearOff {
  const _$PresencesManagementActorStateTearOff();

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
  _MultipleInsertSuccess multipleInsertSuccess(List<Workstation> workstations) {
    return _MultipleInsertSuccess(
      workstations,
    );
  }

// ignore: unused_element
  _DeleteSuccess deleteSuccess(int idWorkstation) {
    return _DeleteSuccess(
      idWorkstation,
    );
  }

// ignore: unused_element
  _UpdateSuccess updateSuccess(Workstation workstation) {
    return _UpdateSuccess(
      workstation,
    );
  }

// ignore: unused_element
  _Failure actionFailure(Failure failure) {
    return _Failure(
      failure,
    );
  }

// ignore: unused_element
  _ShowTimeSlotDialog showTimeSlotDialog(DateTime date,
      [Workstation workstation, User user]) {
    return _ShowTimeSlotDialog(
      date,
      workstation,
      user,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PresencesManagementActorState = _$PresencesManagementActorStateTearOff();

/// @nodoc
mixin _$PresencesManagementActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PresencesManagementActorStateCopyWith<$Res> {
  factory $PresencesManagementActorStateCopyWith(
          PresencesManagementActorState value,
          $Res Function(PresencesManagementActorState) then) =
      _$PresencesManagementActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PresencesManagementActorStateCopyWithImpl<$Res>
    implements $PresencesManagementActorStateCopyWith<$Res> {
  _$PresencesManagementActorStateCopyWithImpl(this._value, this._then);

  final PresencesManagementActorState _value;
  // ignore: unused_field
  final $Res Function(PresencesManagementActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.initial()';
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
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PresencesManagementActorState {
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
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.actionInProgress()';
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
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements PresencesManagementActorState {
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
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.insertSuccess(workstation: $workstation)';
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
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return insertSuccess(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return insertSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertSuccess != null) {
      return insertSuccess(this);
    }
    return orElse();
  }
}

abstract class _InsertSuccess implements PresencesManagementActorState {
  const factory _InsertSuccess(Workstation workstation) = _$_InsertSuccess;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$InsertSuccessCopyWith<_InsertSuccess> get copyWith;
}

/// @nodoc
abstract class _$MultipleInsertSuccessCopyWith<$Res> {
  factory _$MultipleInsertSuccessCopyWith(_MultipleInsertSuccess value,
          $Res Function(_MultipleInsertSuccess) then) =
      __$MultipleInsertSuccessCopyWithImpl<$Res>;
  $Res call({List<Workstation> workstations});
}

/// @nodoc
class __$MultipleInsertSuccessCopyWithImpl<$Res>
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
    implements _$MultipleInsertSuccessCopyWith<$Res> {
  __$MultipleInsertSuccessCopyWithImpl(_MultipleInsertSuccess _value,
      $Res Function(_MultipleInsertSuccess) _then)
      : super(_value, (v) => _then(v as _MultipleInsertSuccess));

  @override
  _MultipleInsertSuccess get _value => super._value as _MultipleInsertSuccess;

  @override
  $Res call({
    Object workstations = freezed,
  }) {
    return _then(_MultipleInsertSuccess(
      workstations == freezed
          ? _value.workstations
          : workstations as List<Workstation>,
    ));
  }
}

/// @nodoc
class _$_MultipleInsertSuccess implements _MultipleInsertSuccess {
  const _$_MultipleInsertSuccess(this.workstations)
      : assert(workstations != null);

  @override
  final List<Workstation> workstations;

  @override
  String toString() {
    return 'PresencesManagementActorState.multipleInsertSuccess(workstations: $workstations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MultipleInsertSuccess &&
            (identical(other.workstations, workstations) ||
                const DeepCollectionEquality()
                    .equals(other.workstations, workstations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(workstations);

  @JsonKey(ignore: true)
  @override
  _$MultipleInsertSuccessCopyWith<_MultipleInsertSuccess> get copyWith =>
      __$MultipleInsertSuccessCopyWithImpl<_MultipleInsertSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return multipleInsertSuccess(workstations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleInsertSuccess != null) {
      return multipleInsertSuccess(workstations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return multipleInsertSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multipleInsertSuccess != null) {
      return multipleInsertSuccess(this);
    }
    return orElse();
  }
}

abstract class _MultipleInsertSuccess implements PresencesManagementActorState {
  const factory _MultipleInsertSuccess(List<Workstation> workstations) =
      _$_MultipleInsertSuccess;

  List<Workstation> get workstations;
  @JsonKey(ignore: true)
  _$MultipleInsertSuccessCopyWith<_MultipleInsertSuccess> get copyWith;
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
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.deleteSuccess(idWorkstation: $idWorkstation)';
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
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return deleteSuccess(idWorkstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements PresencesManagementActorState {
  const factory _DeleteSuccess(int idWorkstation) = _$_DeleteSuccess;

  int get idWorkstation;
  @JsonKey(ignore: true)
  _$DeleteSuccessCopyWith<_DeleteSuccess> get copyWith;
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
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.updateSuccess(workstation: $workstation)';
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
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return updateSuccess(workstation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements PresencesManagementActorState {
  const factory _UpdateSuccess(Workstation workstation) = _$_UpdateSuccess;

  Workstation get workstation;
  @JsonKey(ignore: true)
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
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
    return 'PresencesManagementActorState.actionFailure(failure: $failure)';
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
    @required TResult insertSuccess(Workstation workstation),
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return actionFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return actionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionFailure != null) {
      return actionFailure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements PresencesManagementActorState {
  const factory _Failure(Failure failure) = _$_Failure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith;
}

/// @nodoc
abstract class _$ShowTimeSlotDialogCopyWith<$Res> {
  factory _$ShowTimeSlotDialogCopyWith(
          _ShowTimeSlotDialog value, $Res Function(_ShowTimeSlotDialog) then) =
      __$ShowTimeSlotDialogCopyWithImpl<$Res>;
  $Res call({DateTime date, Workstation workstation, User user});
}

/// @nodoc
class __$ShowTimeSlotDialogCopyWithImpl<$Res>
    extends _$PresencesManagementActorStateCopyWithImpl<$Res>
    implements _$ShowTimeSlotDialogCopyWith<$Res> {
  __$ShowTimeSlotDialogCopyWithImpl(
      _ShowTimeSlotDialog _value, $Res Function(_ShowTimeSlotDialog) _then)
      : super(_value, (v) => _then(v as _ShowTimeSlotDialog));

  @override
  _ShowTimeSlotDialog get _value => super._value as _ShowTimeSlotDialog;

  @override
  $Res call({
    Object date = freezed,
    Object workstation = freezed,
    Object user = freezed,
  }) {
    return _then(_ShowTimeSlotDialog(
      date == freezed ? _value.date : date as DateTime,
      workstation == freezed ? _value.workstation : workstation as Workstation,
      user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$_ShowTimeSlotDialog implements _ShowTimeSlotDialog {
  const _$_ShowTimeSlotDialog(this.date, [this.workstation, this.user])
      : assert(date != null);

  @override
  final DateTime date;
  @override
  final Workstation workstation;
  @override
  final User user;

  @override
  String toString() {
    return 'PresencesManagementActorState.showTimeSlotDialog(date: $date, workstation: $workstation, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowTimeSlotDialog &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.workstation, workstation) ||
                const DeepCollectionEquality()
                    .equals(other.workstation, workstation)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(workstation) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$ShowTimeSlotDialogCopyWith<_ShowTimeSlotDialog> get copyWith =>
      __$ShowTimeSlotDialogCopyWithImpl<_ShowTimeSlotDialog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult insertSuccess(Workstation workstation),
    @required TResult multipleInsertSuccess(List<Workstation> workstations),
    @required TResult deleteSuccess(int idWorkstation),
    @required TResult updateSuccess(Workstation workstation),
    @required TResult actionFailure(Failure failure),
    @required
        TResult showTimeSlotDialog(
            DateTime date, Workstation workstation, User user),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return showTimeSlotDialog(date, workstation, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult insertSuccess(Workstation workstation),
    TResult multipleInsertSuccess(List<Workstation> workstations),
    TResult deleteSuccess(int idWorkstation),
    TResult updateSuccess(Workstation workstation),
    TResult actionFailure(Failure failure),
    TResult showTimeSlotDialog(
        DateTime date, Workstation workstation, User user),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (showTimeSlotDialog != null) {
      return showTimeSlotDialog(date, workstation, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult actionFailure(_Failure value),
    @required TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(insertSuccess != null);
    assert(multipleInsertSuccess != null);
    assert(deleteSuccess != null);
    assert(updateSuccess != null);
    assert(actionFailure != null);
    assert(showTimeSlotDialog != null);
    return showTimeSlotDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult insertSuccess(_InsertSuccess value),
    TResult multipleInsertSuccess(_MultipleInsertSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult actionFailure(_Failure value),
    TResult showTimeSlotDialog(_ShowTimeSlotDialog value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (showTimeSlotDialog != null) {
      return showTimeSlotDialog(this);
    }
    return orElse();
  }
}

abstract class _ShowTimeSlotDialog implements PresencesManagementActorState {
  const factory _ShowTimeSlotDialog(DateTime date,
      [Workstation workstation, User user]) = _$_ShowTimeSlotDialog;

  DateTime get date;
  Workstation get workstation;
  User get user;
  @JsonKey(ignore: true)
  _$ShowTimeSlotDialogCopyWith<_ShowTimeSlotDialog> get copyWith;
}
