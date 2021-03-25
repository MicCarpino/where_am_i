// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reservation_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReservationActorEventTearOff {
  const _$ReservationActorEventTearOff();

// ignore: unused_element
  _Insert insert(Reservation reservation) {
    return _Insert(
      reservation,
    );
  }

// ignore: unused_element
  _Update update(Reservation reservation) {
    return _Update(
      reservation,
    );
  }

// ignore: unused_element
  _Delete delete(int idReservation) {
    return _Delete(
      idReservation,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationActorEvent = _$ReservationActorEventTearOff();

/// @nodoc
mixin _$ReservationActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult insert(Reservation reservation),
    @required TResult update(Reservation reservation),
    @required TResult delete(int idReservation),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult insert(Reservation reservation),
    TResult update(Reservation reservation),
    TResult delete(int idReservation),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult insert(_Insert value),
    @required TResult update(_Update value),
    @required TResult delete(_Delete value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult insert(_Insert value),
    TResult update(_Update value),
    TResult delete(_Delete value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ReservationActorEventCopyWith<$Res> {
  factory $ReservationActorEventCopyWith(ReservationActorEvent value,
          $Res Function(ReservationActorEvent) then) =
      _$ReservationActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationActorEventCopyWithImpl<$Res>
    implements $ReservationActorEventCopyWith<$Res> {
  _$ReservationActorEventCopyWithImpl(this._value, this._then);

  final ReservationActorEvent _value;
  // ignore: unused_field
  final $Res Function(ReservationActorEvent) _then;
}

/// @nodoc
abstract class _$InsertCopyWith<$Res> {
  factory _$InsertCopyWith(_Insert value, $Res Function(_Insert) then) =
      __$InsertCopyWithImpl<$Res>;
  $Res call({Reservation reservation});
}

/// @nodoc
class __$InsertCopyWithImpl<$Res>
    extends _$ReservationActorEventCopyWithImpl<$Res>
    implements _$InsertCopyWith<$Res> {
  __$InsertCopyWithImpl(_Insert _value, $Res Function(_Insert) _then)
      : super(_value, (v) => _then(v as _Insert));

  @override
  _Insert get _value => super._value as _Insert;

  @override
  $Res call({
    Object reservation = freezed,
  }) {
    return _then(_Insert(
      reservation == freezed ? _value.reservation : reservation as Reservation,
    ));
  }
}

/// @nodoc
class _$_Insert implements _Insert {
  const _$_Insert(this.reservation) : assert(reservation != null);

  @override
  final Reservation reservation;

  @override
  String toString() {
    return 'ReservationActorEvent.insert(reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Insert &&
            (identical(other.reservation, reservation) ||
                const DeepCollectionEquality()
                    .equals(other.reservation, reservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservation);

  @JsonKey(ignore: true)
  @override
  _$InsertCopyWith<_Insert> get copyWith =>
      __$InsertCopyWithImpl<_Insert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult insert(Reservation reservation),
    @required TResult update(Reservation reservation),
    @required TResult delete(int idReservation),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return insert(reservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult insert(Reservation reservation),
    TResult update(Reservation reservation),
    TResult delete(int idReservation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insert != null) {
      return insert(reservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult insert(_Insert value),
    @required TResult update(_Update value),
    @required TResult delete(_Delete value),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return insert(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult insert(_Insert value),
    TResult update(_Update value),
    TResult delete(_Delete value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insert != null) {
      return insert(this);
    }
    return orElse();
  }
}

abstract class _Insert implements ReservationActorEvent {
  const factory _Insert(Reservation reservation) = _$_Insert;

  Reservation get reservation;
  @JsonKey(ignore: true)
  _$InsertCopyWith<_Insert> get copyWith;
}

/// @nodoc
abstract class _$UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  $Res call({Reservation reservation});
}

/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    extends _$ReservationActorEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object reservation = freezed,
  }) {
    return _then(_Update(
      reservation == freezed ? _value.reservation : reservation as Reservation,
    ));
  }
}

/// @nodoc
class _$_Update implements _Update {
  const _$_Update(this.reservation) : assert(reservation != null);

  @override
  final Reservation reservation;

  @override
  String toString() {
    return 'ReservationActorEvent.update(reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.reservation, reservation) ||
                const DeepCollectionEquality()
                    .equals(other.reservation, reservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservation);

  @JsonKey(ignore: true)
  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult insert(Reservation reservation),
    @required TResult update(Reservation reservation),
    @required TResult delete(int idReservation),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return update(reservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult insert(Reservation reservation),
    TResult update(Reservation reservation),
    TResult delete(int idReservation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(reservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult insert(_Insert value),
    @required TResult update(_Update value),
    @required TResult delete(_Delete value),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult insert(_Insert value),
    TResult update(_Update value),
    TResult delete(_Delete value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements ReservationActorEvent {
  const factory _Update(Reservation reservation) = _$_Update;

  Reservation get reservation;
  @JsonKey(ignore: true)
  _$UpdateCopyWith<_Update> get copyWith;
}

/// @nodoc
abstract class _$DeleteCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) then) =
      __$DeleteCopyWithImpl<$Res>;
  $Res call({int idReservation});
}

/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    extends _$ReservationActorEventCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(_Delete _value, $Res Function(_Delete) _then)
      : super(_value, (v) => _then(v as _Delete));

  @override
  _Delete get _value => super._value as _Delete;

  @override
  $Res call({
    Object idReservation = freezed,
  }) {
    return _then(_Delete(
      idReservation == freezed ? _value.idReservation : idReservation as int,
    ));
  }
}

/// @nodoc
class _$_Delete implements _Delete {
  const _$_Delete(this.idReservation) : assert(idReservation != null);

  @override
  final int idReservation;

  @override
  String toString() {
    return 'ReservationActorEvent.delete(idReservation: $idReservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Delete &&
            (identical(other.idReservation, idReservation) ||
                const DeepCollectionEquality()
                    .equals(other.idReservation, idReservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idReservation);

  @JsonKey(ignore: true)
  @override
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult insert(Reservation reservation),
    @required TResult update(Reservation reservation),
    @required TResult delete(int idReservation),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return delete(idReservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult insert(Reservation reservation),
    TResult update(Reservation reservation),
    TResult delete(int idReservation),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(idReservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult insert(_Insert value),
    @required TResult update(_Update value),
    @required TResult delete(_Delete value),
  }) {
    assert(insert != null);
    assert(update != null);
    assert(delete != null);
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult insert(_Insert value),
    TResult update(_Update value),
    TResult delete(_Delete value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ReservationActorEvent {
  const factory _Delete(int idReservation) = _$_Delete;

  int get idReservation;
  @JsonKey(ignore: true)
  _$DeleteCopyWith<_Delete> get copyWith;
}

/// @nodoc
class _$ReservationActorStateTearOff {
  const _$ReservationActorStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _InsertSuccess insertSuccess(Reservation reservation) {
    return _InsertSuccess(
      reservation,
    );
  }

// ignore: unused_element
  _UpdateSuccess updateSuccess(Reservation reservation) {
    return _UpdateSuccess(
      reservation,
    );
  }

// ignore: unused_element
  _DeleteSuccess deleteSuccess(int idReservation) {
    return _DeleteSuccess(
      idReservation,
    );
  }

// ignore: unused_element
  _ActionInProgress actionInProgress() {
    return const _ActionInProgress();
  }

// ignore: unused_element
  _ActionFailure actionFailure(Failure failure) {
    return _ActionFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationActorState = _$ReservationActorStateTearOff();

/// @nodoc
mixin _$ReservationActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ReservationActorStateCopyWith<$Res> {
  factory $ReservationActorStateCopyWith(ReservationActorState value,
          $Res Function(ReservationActorState) then) =
      _$ReservationActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationActorStateCopyWithImpl<$Res>
    implements $ReservationActorStateCopyWith<$Res> {
  _$ReservationActorStateCopyWithImpl(this._value, this._then);

  final ReservationActorState _value;
  // ignore: unused_field
  final $Res Function(ReservationActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
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
    return 'ReservationActorState.initial()';
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
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReservationActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$InsertSuccessCopyWith<$Res> {
  factory _$InsertSuccessCopyWith(
          _InsertSuccess value, $Res Function(_InsertSuccess) then) =
      __$InsertSuccessCopyWithImpl<$Res>;
  $Res call({Reservation reservation});
}

/// @nodoc
class __$InsertSuccessCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
    implements _$InsertSuccessCopyWith<$Res> {
  __$InsertSuccessCopyWithImpl(
      _InsertSuccess _value, $Res Function(_InsertSuccess) _then)
      : super(_value, (v) => _then(v as _InsertSuccess));

  @override
  _InsertSuccess get _value => super._value as _InsertSuccess;

  @override
  $Res call({
    Object reservation = freezed,
  }) {
    return _then(_InsertSuccess(
      reservation == freezed ? _value.reservation : reservation as Reservation,
    ));
  }
}

/// @nodoc
class _$_InsertSuccess implements _InsertSuccess {
  const _$_InsertSuccess(this.reservation) : assert(reservation != null);

  @override
  final Reservation reservation;

  @override
  String toString() {
    return 'ReservationActorState.insertSuccess(reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InsertSuccess &&
            (identical(other.reservation, reservation) ||
                const DeepCollectionEquality()
                    .equals(other.reservation, reservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservation);

  @JsonKey(ignore: true)
  @override
  _$InsertSuccessCopyWith<_InsertSuccess> get copyWith =>
      __$InsertSuccessCopyWithImpl<_InsertSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return insertSuccess(reservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertSuccess != null) {
      return insertSuccess(reservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return insertSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (insertSuccess != null) {
      return insertSuccess(this);
    }
    return orElse();
  }
}

abstract class _InsertSuccess implements ReservationActorState {
  const factory _InsertSuccess(Reservation reservation) = _$_InsertSuccess;

  Reservation get reservation;
  @JsonKey(ignore: true)
  _$InsertSuccessCopyWith<_InsertSuccess> get copyWith;
}

/// @nodoc
abstract class _$UpdateSuccessCopyWith<$Res> {
  factory _$UpdateSuccessCopyWith(
          _UpdateSuccess value, $Res Function(_UpdateSuccess) then) =
      __$UpdateSuccessCopyWithImpl<$Res>;
  $Res call({Reservation reservation});
}

/// @nodoc
class __$UpdateSuccessCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
    implements _$UpdateSuccessCopyWith<$Res> {
  __$UpdateSuccessCopyWithImpl(
      _UpdateSuccess _value, $Res Function(_UpdateSuccess) _then)
      : super(_value, (v) => _then(v as _UpdateSuccess));

  @override
  _UpdateSuccess get _value => super._value as _UpdateSuccess;

  @override
  $Res call({
    Object reservation = freezed,
  }) {
    return _then(_UpdateSuccess(
      reservation == freezed ? _value.reservation : reservation as Reservation,
    ));
  }
}

/// @nodoc
class _$_UpdateSuccess implements _UpdateSuccess {
  const _$_UpdateSuccess(this.reservation) : assert(reservation != null);

  @override
  final Reservation reservation;

  @override
  String toString() {
    return 'ReservationActorState.updateSuccess(reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateSuccess &&
            (identical(other.reservation, reservation) ||
                const DeepCollectionEquality()
                    .equals(other.reservation, reservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservation);

  @JsonKey(ignore: true)
  @override
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith =>
      __$UpdateSuccessCopyWithImpl<_UpdateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return updateSuccess(reservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(reservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSuccess implements ReservationActorState {
  const factory _UpdateSuccess(Reservation reservation) = _$_UpdateSuccess;

  Reservation get reservation;
  @JsonKey(ignore: true)
  _$UpdateSuccessCopyWith<_UpdateSuccess> get copyWith;
}

/// @nodoc
abstract class _$DeleteSuccessCopyWith<$Res> {
  factory _$DeleteSuccessCopyWith(
          _DeleteSuccess value, $Res Function(_DeleteSuccess) then) =
      __$DeleteSuccessCopyWithImpl<$Res>;
  $Res call({int idReservation});
}

/// @nodoc
class __$DeleteSuccessCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
    implements _$DeleteSuccessCopyWith<$Res> {
  __$DeleteSuccessCopyWithImpl(
      _DeleteSuccess _value, $Res Function(_DeleteSuccess) _then)
      : super(_value, (v) => _then(v as _DeleteSuccess));

  @override
  _DeleteSuccess get _value => super._value as _DeleteSuccess;

  @override
  $Res call({
    Object idReservation = freezed,
  }) {
    return _then(_DeleteSuccess(
      idReservation == freezed ? _value.idReservation : idReservation as int,
    ));
  }
}

/// @nodoc
class _$_DeleteSuccess implements _DeleteSuccess {
  const _$_DeleteSuccess(this.idReservation) : assert(idReservation != null);

  @override
  final int idReservation;

  @override
  String toString() {
    return 'ReservationActorState.deleteSuccess(idReservation: $idReservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteSuccess &&
            (identical(other.idReservation, idReservation) ||
                const DeepCollectionEquality()
                    .equals(other.idReservation, idReservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idReservation);

  @JsonKey(ignore: true)
  @override
  _$DeleteSuccessCopyWith<_DeleteSuccess> get copyWith =>
      __$DeleteSuccessCopyWithImpl<_DeleteSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return deleteSuccess(idReservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(idReservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements ReservationActorState {
  const factory _DeleteSuccess(int idReservation) = _$_DeleteSuccess;

  int get idReservation;
  @JsonKey(ignore: true)
  _$DeleteSuccessCopyWith<_DeleteSuccess> get copyWith;
}

/// @nodoc
abstract class _$ActionInProgressCopyWith<$Res> {
  factory _$ActionInProgressCopyWith(
          _ActionInProgress value, $Res Function(_ActionInProgress) then) =
      __$ActionInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$ActionInProgressCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
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
    return 'ReservationActorState.actionInProgress()';
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
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements ReservationActorState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$ActionFailureCopyWith<$Res> {
  factory _$ActionFailureCopyWith(
          _ActionFailure value, $Res Function(_ActionFailure) then) =
      __$ActionFailureCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$ActionFailureCopyWithImpl<$Res>
    extends _$ReservationActorStateCopyWithImpl<$Res>
    implements _$ActionFailureCopyWith<$Res> {
  __$ActionFailureCopyWithImpl(
      _ActionFailure _value, $Res Function(_ActionFailure) _then)
      : super(_value, (v) => _then(v as _ActionFailure));

  @override
  _ActionFailure get _value => super._value as _ActionFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_ActionFailure(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$_ActionFailure implements _ActionFailure {
  const _$_ActionFailure(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ReservationActorState.actionFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActionFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$ActionFailureCopyWith<_ActionFailure> get copyWith =>
      __$ActionFailureCopyWithImpl<_ActionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult insertSuccess(Reservation reservation),
    @required TResult updateSuccess(Reservation reservation),
    @required TResult deleteSuccess(int idReservation),
    @required TResult actionInProgress(),
    @required TResult actionFailure(Failure failure),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return actionFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult insertSuccess(Reservation reservation),
    TResult updateSuccess(Reservation reservation),
    TResult deleteSuccess(int idReservation),
    TResult actionInProgress(),
    TResult actionFailure(Failure failure),
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
    @required TResult insertSuccess(_InsertSuccess value),
    @required TResult updateSuccess(_UpdateSuccess value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult actionFailure(_ActionFailure value),
  }) {
    assert(initial != null);
    assert(insertSuccess != null);
    assert(updateSuccess != null);
    assert(deleteSuccess != null);
    assert(actionInProgress != null);
    assert(actionFailure != null);
    return actionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult insertSuccess(_InsertSuccess value),
    TResult updateSuccess(_UpdateSuccess value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult actionInProgress(_ActionInProgress value),
    TResult actionFailure(_ActionFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionFailure != null) {
      return actionFailure(this);
    }
    return orElse();
  }
}

abstract class _ActionFailure implements ReservationActorState {
  const factory _ActionFailure(Failure failure) = _$_ActionFailure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$ActionFailureCopyWith<_ActionFailure> get copyWith;
}
