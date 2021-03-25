// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reservation_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReservationWatcherEventTearOff {
  const _$ReservationWatcherEventTearOff();

// ignore: unused_element
  _FetchReservations fetchReservations(DateTime date) {
    return _FetchReservations(
      date,
    );
  }

// ignore: unused_element
  _OnReservationsUpdate onReservationsUpdate(List<Reservation> reservations) {
    return _OnReservationsUpdate(
      reservations,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationWatcherEvent = _$ReservationWatcherEventTearOff();

/// @nodoc
mixin _$ReservationWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchReservations(DateTime date),
    @required TResult onReservationsUpdate(List<Reservation> reservations),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchReservations(DateTime date),
    TResult onReservationsUpdate(List<Reservation> reservations),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchReservations(_FetchReservations value),
    @required TResult onReservationsUpdate(_OnReservationsUpdate value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchReservations(_FetchReservations value),
    TResult onReservationsUpdate(_OnReservationsUpdate value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ReservationWatcherEventCopyWith<$Res> {
  factory $ReservationWatcherEventCopyWith(ReservationWatcherEvent value,
          $Res Function(ReservationWatcherEvent) then) =
      _$ReservationWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationWatcherEventCopyWithImpl<$Res>
    implements $ReservationWatcherEventCopyWith<$Res> {
  _$ReservationWatcherEventCopyWithImpl(this._value, this._then);

  final ReservationWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(ReservationWatcherEvent) _then;
}

/// @nodoc
abstract class _$FetchReservationsCopyWith<$Res> {
  factory _$FetchReservationsCopyWith(
          _FetchReservations value, $Res Function(_FetchReservations) then) =
      __$FetchReservationsCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$FetchReservationsCopyWithImpl<$Res>
    extends _$ReservationWatcherEventCopyWithImpl<$Res>
    implements _$FetchReservationsCopyWith<$Res> {
  __$FetchReservationsCopyWithImpl(
      _FetchReservations _value, $Res Function(_FetchReservations) _then)
      : super(_value, (v) => _then(v as _FetchReservations));

  @override
  _FetchReservations get _value => super._value as _FetchReservations;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(_FetchReservations(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_FetchReservations implements _FetchReservations {
  const _$_FetchReservations(this.date) : assert(date != null);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'ReservationWatcherEvent.fetchReservations(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FetchReservations &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$FetchReservationsCopyWith<_FetchReservations> get copyWith =>
      __$FetchReservationsCopyWithImpl<_FetchReservations>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchReservations(DateTime date),
    @required TResult onReservationsUpdate(List<Reservation> reservations),
  }) {
    assert(fetchReservations != null);
    assert(onReservationsUpdate != null);
    return fetchReservations(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchReservations(DateTime date),
    TResult onReservationsUpdate(List<Reservation> reservations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchReservations != null) {
      return fetchReservations(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchReservations(_FetchReservations value),
    @required TResult onReservationsUpdate(_OnReservationsUpdate value),
  }) {
    assert(fetchReservations != null);
    assert(onReservationsUpdate != null);
    return fetchReservations(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchReservations(_FetchReservations value),
    TResult onReservationsUpdate(_OnReservationsUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (fetchReservations != null) {
      return fetchReservations(this);
    }
    return orElse();
  }
}

abstract class _FetchReservations implements ReservationWatcherEvent {
  const factory _FetchReservations(DateTime date) = _$_FetchReservations;

  DateTime get date;
  @JsonKey(ignore: true)
  _$FetchReservationsCopyWith<_FetchReservations> get copyWith;
}

/// @nodoc
abstract class _$OnReservationsUpdateCopyWith<$Res> {
  factory _$OnReservationsUpdateCopyWith(_OnReservationsUpdate value,
          $Res Function(_OnReservationsUpdate) then) =
      __$OnReservationsUpdateCopyWithImpl<$Res>;
  $Res call({List<Reservation> reservations});
}

/// @nodoc
class __$OnReservationsUpdateCopyWithImpl<$Res>
    extends _$ReservationWatcherEventCopyWithImpl<$Res>
    implements _$OnReservationsUpdateCopyWith<$Res> {
  __$OnReservationsUpdateCopyWithImpl(
      _OnReservationsUpdate _value, $Res Function(_OnReservationsUpdate) _then)
      : super(_value, (v) => _then(v as _OnReservationsUpdate));

  @override
  _OnReservationsUpdate get _value => super._value as _OnReservationsUpdate;

  @override
  $Res call({
    Object reservations = freezed,
  }) {
    return _then(_OnReservationsUpdate(
      reservations == freezed
          ? _value.reservations
          : reservations as List<Reservation>,
    ));
  }
}

/// @nodoc
class _$_OnReservationsUpdate implements _OnReservationsUpdate {
  const _$_OnReservationsUpdate(this.reservations)
      : assert(reservations != null);

  @override
  final List<Reservation> reservations;

  @override
  String toString() {
    return 'ReservationWatcherEvent.onReservationsUpdate(reservations: $reservations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnReservationsUpdate &&
            (identical(other.reservations, reservations) ||
                const DeepCollectionEquality()
                    .equals(other.reservations, reservations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservations);

  @JsonKey(ignore: true)
  @override
  _$OnReservationsUpdateCopyWith<_OnReservationsUpdate> get copyWith =>
      __$OnReservationsUpdateCopyWithImpl<_OnReservationsUpdate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult fetchReservations(DateTime date),
    @required TResult onReservationsUpdate(List<Reservation> reservations),
  }) {
    assert(fetchReservations != null);
    assert(onReservationsUpdate != null);
    return onReservationsUpdate(reservations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult fetchReservations(DateTime date),
    TResult onReservationsUpdate(List<Reservation> reservations),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onReservationsUpdate != null) {
      return onReservationsUpdate(reservations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult fetchReservations(_FetchReservations value),
    @required TResult onReservationsUpdate(_OnReservationsUpdate value),
  }) {
    assert(fetchReservations != null);
    assert(onReservationsUpdate != null);
    return onReservationsUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult fetchReservations(_FetchReservations value),
    TResult onReservationsUpdate(_OnReservationsUpdate value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onReservationsUpdate != null) {
      return onReservationsUpdate(this);
    }
    return orElse();
  }
}

abstract class _OnReservationsUpdate implements ReservationWatcherEvent {
  const factory _OnReservationsUpdate(List<Reservation> reservations) =
      _$_OnReservationsUpdate;

  List<Reservation> get reservations;
  @JsonKey(ignore: true)
  _$OnReservationsUpdateCopyWith<_OnReservationsUpdate> get copyWith;
}

/// @nodoc
class _$ReservationWatcherStateTearOff {
  const _$ReservationWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(List<Reservation> reservations) {
    return _LoadSuccess(
      reservations,
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
const $ReservationWatcherState = _$ReservationWatcherStateTearOff();

/// @nodoc
mixin _$ReservationWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<Reservation> reservations),
    @required TResult loadFailure(String errorMessage),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<Reservation> reservations),
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
abstract class $ReservationWatcherStateCopyWith<$Res> {
  factory $ReservationWatcherStateCopyWith(ReservationWatcherState value,
          $Res Function(ReservationWatcherState) then) =
      _$ReservationWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationWatcherStateCopyWithImpl<$Res>
    implements $ReservationWatcherStateCopyWith<$Res> {
  _$ReservationWatcherStateCopyWithImpl(this._value, this._then);

  final ReservationWatcherState _value;
  // ignore: unused_field
  final $Res Function(ReservationWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ReservationWatcherStateCopyWithImpl<$Res>
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
    return 'ReservationWatcherState.initial()';
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
    @required TResult loadSuccess(List<Reservation> reservations),
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
    TResult loadSuccess(List<Reservation> reservations),
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

abstract class _Initial implements ReservationWatcherState {
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
    extends _$ReservationWatcherStateCopyWithImpl<$Res>
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
    return 'ReservationWatcherState.loadInProgress()';
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
    @required TResult loadSuccess(List<Reservation> reservations),
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
    TResult loadSuccess(List<Reservation> reservations),
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

abstract class _LoadInProgress implements ReservationWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Reservation> reservations});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$ReservationWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object reservations = freezed,
  }) {
    return _then(_LoadSuccess(
      reservations == freezed
          ? _value.reservations
          : reservations as List<Reservation>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.reservations) : assert(reservations != null);

  @override
  final List<Reservation> reservations;

  @override
  String toString() {
    return 'ReservationWatcherState.loadSuccess(reservations: $reservations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.reservations, reservations) ||
                const DeepCollectionEquality()
                    .equals(other.reservations, reservations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservations);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(List<Reservation> reservations),
    @required TResult loadFailure(String errorMessage),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(reservations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(List<Reservation> reservations),
    TResult loadFailure(String errorMessage),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(reservations);
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

abstract class _LoadSuccess implements ReservationWatcherState {
  const factory _LoadSuccess(List<Reservation> reservations) = _$_LoadSuccess;

  List<Reservation> get reservations;
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
    extends _$ReservationWatcherStateCopyWithImpl<$Res>
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
    return 'ReservationWatcherState.loadFailure(errorMessage: $errorMessage)';
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
    @required TResult loadSuccess(List<Reservation> reservations),
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
    TResult loadSuccess(List<Reservation> reservations),
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

abstract class _LoadFailure implements ReservationWatcherState {
  const factory _LoadFailure(String errorMessage) = _$_LoadFailure;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
