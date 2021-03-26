// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reservation_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReservationFormEventTearOff {
  const _$ReservationFormEventTearOff();

// ignore: unused_element
  _InitializeEmpty initializeEmpty(int idRoom, DateTime date, int idHandler) {
    return _InitializeEmpty(
      idRoom,
      date,
      idHandler,
    );
  }

// ignore: unused_element
  _InitializeEdit initializeEdit(Reservation reservation) {
    return _InitializeEdit(
      reservation,
    );
  }

// ignore: unused_element
  _IdRoomChanged idRoomChanged(int idRoom) {
    return _IdRoomChanged(
      idRoom,
    );
  }

// ignore: unused_element
  _StartTimeChanged startTimeChanged(TimeOfDay startTime) {
    return _StartTimeChanged(
      startTime,
    );
  }

// ignore: unused_element
  _EndTimeChanged endTimeChanged(TimeOfDay endTime) {
    return _EndTimeChanged(
      endTime,
    );
  }

// ignore: unused_element
  _DescriptionChanged descriptionChanged(String description) {
    return _DescriptionChanged(
      description,
    );
  }

// ignore: unused_element
  _ParticipantsChanged participantsChanged(List<String> participants) {
    return _ParticipantsChanged(
      participants,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationFormEvent = _$ReservationFormEventTearOff();

/// @nodoc
mixin _$ReservationFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ReservationFormEventCopyWith<$Res> {
  factory $ReservationFormEventCopyWith(ReservationFormEvent value,
          $Res Function(ReservationFormEvent) then) =
      _$ReservationFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationFormEventCopyWithImpl<$Res>
    implements $ReservationFormEventCopyWith<$Res> {
  _$ReservationFormEventCopyWithImpl(this._value, this._then);

  final ReservationFormEvent _value;
  // ignore: unused_field
  final $Res Function(ReservationFormEvent) _then;
}

/// @nodoc
abstract class _$InitializeEmptyCopyWith<$Res> {
  factory _$InitializeEmptyCopyWith(
          _InitializeEmpty value, $Res Function(_InitializeEmpty) then) =
      __$InitializeEmptyCopyWithImpl<$Res>;
  $Res call({int idRoom, DateTime date, int idHandler});
}

/// @nodoc
class __$InitializeEmptyCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$InitializeEmptyCopyWith<$Res> {
  __$InitializeEmptyCopyWithImpl(
      _InitializeEmpty _value, $Res Function(_InitializeEmpty) _then)
      : super(_value, (v) => _then(v as _InitializeEmpty));

  @override
  _InitializeEmpty get _value => super._value as _InitializeEmpty;

  @override
  $Res call({
    Object idRoom = freezed,
    Object date = freezed,
    Object idHandler = freezed,
  }) {
    return _then(_InitializeEmpty(
      idRoom == freezed ? _value.idRoom : idRoom as int,
      date == freezed ? _value.date : date as DateTime,
      idHandler == freezed ? _value.idHandler : idHandler as int,
    ));
  }
}

/// @nodoc
class _$_InitializeEmpty implements _InitializeEmpty {
  const _$_InitializeEmpty(this.idRoom, this.date, this.idHandler)
      : assert(idRoom != null),
        assert(date != null),
        assert(idHandler != null);

  @override
  final int idRoom;
  @override
  final DateTime date;
  @override
  final int idHandler;

  @override
  String toString() {
    return 'ReservationFormEvent.initializeEmpty(idRoom: $idRoom, date: $date, idHandler: $idHandler)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InitializeEmpty &&
            (identical(other.idRoom, idRoom) ||
                const DeepCollectionEquality().equals(other.idRoom, idRoom)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.idHandler, idHandler) ||
                const DeepCollectionEquality()
                    .equals(other.idHandler, idHandler)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idRoom) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(idHandler);

  @JsonKey(ignore: true)
  @override
  _$InitializeEmptyCopyWith<_InitializeEmpty> get copyWith =>
      __$InitializeEmptyCopyWithImpl<_InitializeEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return initializeEmpty(idRoom, date, idHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeEmpty != null) {
      return initializeEmpty(idRoom, date, idHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return initializeEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeEmpty != null) {
      return initializeEmpty(this);
    }
    return orElse();
  }
}

abstract class _InitializeEmpty implements ReservationFormEvent {
  const factory _InitializeEmpty(int idRoom, DateTime date, int idHandler) =
      _$_InitializeEmpty;

  int get idRoom;
  DateTime get date;
  int get idHandler;
  @JsonKey(ignore: true)
  _$InitializeEmptyCopyWith<_InitializeEmpty> get copyWith;
}

/// @nodoc
abstract class _$InitializeEditCopyWith<$Res> {
  factory _$InitializeEditCopyWith(
          _InitializeEdit value, $Res Function(_InitializeEdit) then) =
      __$InitializeEditCopyWithImpl<$Res>;
  $Res call({Reservation reservation});
}

/// @nodoc
class __$InitializeEditCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$InitializeEditCopyWith<$Res> {
  __$InitializeEditCopyWithImpl(
      _InitializeEdit _value, $Res Function(_InitializeEdit) _then)
      : super(_value, (v) => _then(v as _InitializeEdit));

  @override
  _InitializeEdit get _value => super._value as _InitializeEdit;

  @override
  $Res call({
    Object reservation = freezed,
  }) {
    return _then(_InitializeEdit(
      reservation == freezed ? _value.reservation : reservation as Reservation,
    ));
  }
}

/// @nodoc
class _$_InitializeEdit implements _InitializeEdit {
  const _$_InitializeEdit(this.reservation) : assert(reservation != null);

  @override
  final Reservation reservation;

  @override
  String toString() {
    return 'ReservationFormEvent.initializeEdit(reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InitializeEdit &&
            (identical(other.reservation, reservation) ||
                const DeepCollectionEquality()
                    .equals(other.reservation, reservation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reservation);

  @JsonKey(ignore: true)
  @override
  _$InitializeEditCopyWith<_InitializeEdit> get copyWith =>
      __$InitializeEditCopyWithImpl<_InitializeEdit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return initializeEdit(reservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeEdit != null) {
      return initializeEdit(reservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return initializeEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeEdit != null) {
      return initializeEdit(this);
    }
    return orElse();
  }
}

abstract class _InitializeEdit implements ReservationFormEvent {
  const factory _InitializeEdit(Reservation reservation) = _$_InitializeEdit;

  Reservation get reservation;
  @JsonKey(ignore: true)
  _$InitializeEditCopyWith<_InitializeEdit> get copyWith;
}

/// @nodoc
abstract class _$IdRoomChangedCopyWith<$Res> {
  factory _$IdRoomChangedCopyWith(
          _IdRoomChanged value, $Res Function(_IdRoomChanged) then) =
      __$IdRoomChangedCopyWithImpl<$Res>;
  $Res call({int idRoom});
}

/// @nodoc
class __$IdRoomChangedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$IdRoomChangedCopyWith<$Res> {
  __$IdRoomChangedCopyWithImpl(
      _IdRoomChanged _value, $Res Function(_IdRoomChanged) _then)
      : super(_value, (v) => _then(v as _IdRoomChanged));

  @override
  _IdRoomChanged get _value => super._value as _IdRoomChanged;

  @override
  $Res call({
    Object idRoom = freezed,
  }) {
    return _then(_IdRoomChanged(
      idRoom == freezed ? _value.idRoom : idRoom as int,
    ));
  }
}

/// @nodoc
class _$_IdRoomChanged implements _IdRoomChanged {
  const _$_IdRoomChanged(this.idRoom) : assert(idRoom != null);

  @override
  final int idRoom;

  @override
  String toString() {
    return 'ReservationFormEvent.idRoomChanged(idRoom: $idRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IdRoomChanged &&
            (identical(other.idRoom, idRoom) ||
                const DeepCollectionEquality().equals(other.idRoom, idRoom)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(idRoom);

  @JsonKey(ignore: true)
  @override
  _$IdRoomChangedCopyWith<_IdRoomChanged> get copyWith =>
      __$IdRoomChangedCopyWithImpl<_IdRoomChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return idRoomChanged(idRoom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (idRoomChanged != null) {
      return idRoomChanged(idRoom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return idRoomChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (idRoomChanged != null) {
      return idRoomChanged(this);
    }
    return orElse();
  }
}

abstract class _IdRoomChanged implements ReservationFormEvent {
  const factory _IdRoomChanged(int idRoom) = _$_IdRoomChanged;

  int get idRoom;
  @JsonKey(ignore: true)
  _$IdRoomChangedCopyWith<_IdRoomChanged> get copyWith;
}

/// @nodoc
abstract class _$StartTimeChangedCopyWith<$Res> {
  factory _$StartTimeChangedCopyWith(
          _StartTimeChanged value, $Res Function(_StartTimeChanged) then) =
      __$StartTimeChangedCopyWithImpl<$Res>;
  $Res call({TimeOfDay startTime});
}

/// @nodoc
class __$StartTimeChangedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$StartTimeChangedCopyWith<$Res> {
  __$StartTimeChangedCopyWithImpl(
      _StartTimeChanged _value, $Res Function(_StartTimeChanged) _then)
      : super(_value, (v) => _then(v as _StartTimeChanged));

  @override
  _StartTimeChanged get _value => super._value as _StartTimeChanged;

  @override
  $Res call({
    Object startTime = freezed,
  }) {
    return _then(_StartTimeChanged(
      startTime == freezed ? _value.startTime : startTime as TimeOfDay,
    ));
  }
}

/// @nodoc
class _$_StartTimeChanged implements _StartTimeChanged {
  const _$_StartTimeChanged(this.startTime) : assert(startTime != null);

  @override
  final TimeOfDay startTime;

  @override
  String toString() {
    return 'ReservationFormEvent.startTimeChanged(startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StartTimeChanged &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(startTime);

  @JsonKey(ignore: true)
  @override
  _$StartTimeChangedCopyWith<_StartTimeChanged> get copyWith =>
      __$StartTimeChangedCopyWithImpl<_StartTimeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return startTimeChanged(startTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startTimeChanged != null) {
      return startTimeChanged(startTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return startTimeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (startTimeChanged != null) {
      return startTimeChanged(this);
    }
    return orElse();
  }
}

abstract class _StartTimeChanged implements ReservationFormEvent {
  const factory _StartTimeChanged(TimeOfDay startTime) = _$_StartTimeChanged;

  TimeOfDay get startTime;
  @JsonKey(ignore: true)
  _$StartTimeChangedCopyWith<_StartTimeChanged> get copyWith;
}

/// @nodoc
abstract class _$EndTimeChangedCopyWith<$Res> {
  factory _$EndTimeChangedCopyWith(
          _EndTimeChanged value, $Res Function(_EndTimeChanged) then) =
      __$EndTimeChangedCopyWithImpl<$Res>;
  $Res call({TimeOfDay endTime});
}

/// @nodoc
class __$EndTimeChangedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$EndTimeChangedCopyWith<$Res> {
  __$EndTimeChangedCopyWithImpl(
      _EndTimeChanged _value, $Res Function(_EndTimeChanged) _then)
      : super(_value, (v) => _then(v as _EndTimeChanged));

  @override
  _EndTimeChanged get _value => super._value as _EndTimeChanged;

  @override
  $Res call({
    Object endTime = freezed,
  }) {
    return _then(_EndTimeChanged(
      endTime == freezed ? _value.endTime : endTime as TimeOfDay,
    ));
  }
}

/// @nodoc
class _$_EndTimeChanged implements _EndTimeChanged {
  const _$_EndTimeChanged(this.endTime) : assert(endTime != null);

  @override
  final TimeOfDay endTime;

  @override
  String toString() {
    return 'ReservationFormEvent.endTimeChanged(endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EndTimeChanged &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality().equals(other.endTime, endTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(endTime);

  @JsonKey(ignore: true)
  @override
  _$EndTimeChangedCopyWith<_EndTimeChanged> get copyWith =>
      __$EndTimeChangedCopyWithImpl<_EndTimeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return endTimeChanged(endTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (endTimeChanged != null) {
      return endTimeChanged(endTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return endTimeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (endTimeChanged != null) {
      return endTimeChanged(this);
    }
    return orElse();
  }
}

abstract class _EndTimeChanged implements ReservationFormEvent {
  const factory _EndTimeChanged(TimeOfDay endTime) = _$_EndTimeChanged;

  TimeOfDay get endTime;
  @JsonKey(ignore: true)
  _$EndTimeChangedCopyWith<_EndTimeChanged> get copyWith;
}

/// @nodoc
abstract class _$DescriptionChangedCopyWith<$Res> {
  factory _$DescriptionChangedCopyWith(
          _DescriptionChanged value, $Res Function(_DescriptionChanged) then) =
      __$DescriptionChangedCopyWithImpl<$Res>;
  $Res call({String description});
}

/// @nodoc
class __$DescriptionChangedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$DescriptionChangedCopyWith<$Res> {
  __$DescriptionChangedCopyWithImpl(
      _DescriptionChanged _value, $Res Function(_DescriptionChanged) _then)
      : super(_value, (v) => _then(v as _DescriptionChanged));

  @override
  _DescriptionChanged get _value => super._value as _DescriptionChanged;

  @override
  $Res call({
    Object description = freezed,
  }) {
    return _then(_DescriptionChanged(
      description == freezed ? _value.description : description as String,
    ));
  }
}

/// @nodoc
class _$_DescriptionChanged implements _DescriptionChanged {
  const _$_DescriptionChanged(this.description) : assert(description != null);

  @override
  final String description;

  @override
  String toString() {
    return 'ReservationFormEvent.descriptionChanged(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DescriptionChanged &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith =>
      __$DescriptionChangedCopyWithImpl<_DescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class _DescriptionChanged implements ReservationFormEvent {
  const factory _DescriptionChanged(String description) = _$_DescriptionChanged;

  String get description;
  @JsonKey(ignore: true)
  _$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith;
}

/// @nodoc
abstract class _$ParticipantsChangedCopyWith<$Res> {
  factory _$ParticipantsChangedCopyWith(_ParticipantsChanged value,
          $Res Function(_ParticipantsChanged) then) =
      __$ParticipantsChangedCopyWithImpl<$Res>;
  $Res call({List<String> participants});
}

/// @nodoc
class __$ParticipantsChangedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$ParticipantsChangedCopyWith<$Res> {
  __$ParticipantsChangedCopyWithImpl(
      _ParticipantsChanged _value, $Res Function(_ParticipantsChanged) _then)
      : super(_value, (v) => _then(v as _ParticipantsChanged));

  @override
  _ParticipantsChanged get _value => super._value as _ParticipantsChanged;

  @override
  $Res call({
    Object participants = freezed,
  }) {
    return _then(_ParticipantsChanged(
      participants == freezed
          ? _value.participants
          : participants as List<String>,
    ));
  }
}

/// @nodoc
class _$_ParticipantsChanged implements _ParticipantsChanged {
  const _$_ParticipantsChanged(this.participants)
      : assert(participants != null);

  @override
  final List<String> participants;

  @override
  String toString() {
    return 'ReservationFormEvent.participantsChanged(participants: $participants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParticipantsChanged &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(participants);

  @JsonKey(ignore: true)
  @override
  _$ParticipantsChangedCopyWith<_ParticipantsChanged> get copyWith =>
      __$ParticipantsChangedCopyWithImpl<_ParticipantsChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return participantsChanged(participants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (participantsChanged != null) {
      return participantsChanged(participants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return participantsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (participantsChanged != null) {
      return participantsChanged(this);
    }
    return orElse();
  }
}

abstract class _ParticipantsChanged implements ReservationFormEvent {
  const factory _ParticipantsChanged(List<String> participants) =
      _$_ParticipantsChanged;

  List<String> get participants;
  @JsonKey(ignore: true)
  _$ParticipantsChangedCopyWith<_ParticipantsChanged> get copyWith;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res>
    extends _$ReservationFormEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'ReservationFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    @required TResult initializeEdit(Reservation reservation),
    @required TResult idRoomChanged(int idRoom),
    @required TResult startTimeChanged(TimeOfDay startTime),
    @required TResult endTimeChanged(TimeOfDay endTime),
    @required TResult descriptionChanged(String description),
    @required TResult participantsChanged(List<String> participants),
    @required TResult saved(),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeEmpty(int idRoom, DateTime date, int idHandler),
    TResult initializeEdit(Reservation reservation),
    TResult idRoomChanged(int idRoom),
    TResult startTimeChanged(TimeOfDay startTime),
    TResult endTimeChanged(TimeOfDay endTime),
    TResult descriptionChanged(String description),
    TResult participantsChanged(List<String> participants),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeEmpty(_InitializeEmpty value),
    @required TResult initializeEdit(_InitializeEdit value),
    @required TResult idRoomChanged(_IdRoomChanged value),
    @required TResult startTimeChanged(_StartTimeChanged value),
    @required TResult endTimeChanged(_EndTimeChanged value),
    @required TResult descriptionChanged(_DescriptionChanged value),
    @required TResult participantsChanged(_ParticipantsChanged value),
    @required TResult saved(_Saved value),
  }) {
    assert(initializeEmpty != null);
    assert(initializeEdit != null);
    assert(idRoomChanged != null);
    assert(startTimeChanged != null);
    assert(endTimeChanged != null);
    assert(descriptionChanged != null);
    assert(participantsChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeEmpty(_InitializeEmpty value),
    TResult initializeEdit(_InitializeEdit value),
    TResult idRoomChanged(_IdRoomChanged value),
    TResult startTimeChanged(_StartTimeChanged value),
    TResult endTimeChanged(_EndTimeChanged value),
    TResult descriptionChanged(_DescriptionChanged value),
    TResult participantsChanged(_ParticipantsChanged value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements ReservationFormEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$ReservationFormStateTearOff {
  const _$ReservationFormStateTearOff();

// ignore: unused_element
  _ReservationFormState call(
      {ReservationForm reservationForm,
      @required bool isEditing,
      @required bool isSaving,
      @required Option<Either<Failure, Unit>> saveFailureOrSuccessOption}) {
    return _ReservationFormState(
      reservationForm: reservationForm,
      isEditing: isEditing,
      isSaving: isSaving,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationFormState = _$ReservationFormStateTearOff();

/// @nodoc
mixin _$ReservationFormState {
  ReservationForm get reservationForm;
  bool get isEditing;
  bool get isSaving;
  Option<Either<Failure, Unit>> get saveFailureOrSuccessOption;

  @JsonKey(ignore: true)
  $ReservationFormStateCopyWith<ReservationFormState> get copyWith;
}

/// @nodoc
abstract class $ReservationFormStateCopyWith<$Res> {
  factory $ReservationFormStateCopyWith(ReservationFormState value,
          $Res Function(ReservationFormState) then) =
      _$ReservationFormStateCopyWithImpl<$Res>;
  $Res call(
      {ReservationForm reservationForm,
      bool isEditing,
      bool isSaving,
      Option<Either<Failure, Unit>> saveFailureOrSuccessOption});

  $ReservationFormCopyWith<$Res> get reservationForm;
}

/// @nodoc
class _$ReservationFormStateCopyWithImpl<$Res>
    implements $ReservationFormStateCopyWith<$Res> {
  _$ReservationFormStateCopyWithImpl(this._value, this._then);

  final ReservationFormState _value;
  // ignore: unused_field
  final $Res Function(ReservationFormState) _then;

  @override
  $Res call({
    Object reservationForm = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      reservationForm: reservationForm == freezed
          ? _value.reservationForm
          : reservationForm as ReservationForm,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<Failure, Unit>>,
    ));
  }

  @override
  $ReservationFormCopyWith<$Res> get reservationForm {
    if (_value.reservationForm == null) {
      return null;
    }
    return $ReservationFormCopyWith<$Res>(_value.reservationForm, (value) {
      return _then(_value.copyWith(reservationForm: value));
    });
  }
}

/// @nodoc
abstract class _$ReservationFormStateCopyWith<$Res>
    implements $ReservationFormStateCopyWith<$Res> {
  factory _$ReservationFormStateCopyWith(_ReservationFormState value,
          $Res Function(_ReservationFormState) then) =
      __$ReservationFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ReservationForm reservationForm,
      bool isEditing,
      bool isSaving,
      Option<Either<Failure, Unit>> saveFailureOrSuccessOption});

  @override
  $ReservationFormCopyWith<$Res> get reservationForm;
}

/// @nodoc
class __$ReservationFormStateCopyWithImpl<$Res>
    extends _$ReservationFormStateCopyWithImpl<$Res>
    implements _$ReservationFormStateCopyWith<$Res> {
  __$ReservationFormStateCopyWithImpl(
      _ReservationFormState _value, $Res Function(_ReservationFormState) _then)
      : super(_value, (v) => _then(v as _ReservationFormState));

  @override
  _ReservationFormState get _value => super._value as _ReservationFormState;

  @override
  $Res call({
    Object reservationForm = freezed,
    Object isEditing = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_ReservationFormState(
      reservationForm: reservationForm == freezed
          ? _value.reservationForm
          : reservationForm as ReservationForm,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_ReservationFormState implements _ReservationFormState {
  const _$_ReservationFormState(
      {this.reservationForm,
      @required this.isEditing,
      @required this.isSaving,
      @required this.saveFailureOrSuccessOption})
      : assert(isEditing != null),
        assert(isSaving != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final ReservationForm reservationForm;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<Failure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'ReservationFormState(reservationForm: $reservationForm, isEditing: $isEditing, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReservationFormState &&
            (identical(other.reservationForm, reservationForm) ||
                const DeepCollectionEquality()
                    .equals(other.reservationForm, reservationForm)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reservationForm) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$ReservationFormStateCopyWith<_ReservationFormState> get copyWith =>
      __$ReservationFormStateCopyWithImpl<_ReservationFormState>(
          this, _$identity);
}

abstract class _ReservationFormState implements ReservationFormState {
  const factory _ReservationFormState(
          {ReservationForm reservationForm,
          @required bool isEditing,
          @required bool isSaving,
          @required Option<Either<Failure, Unit>> saveFailureOrSuccessOption}) =
      _$_ReservationFormState;

  @override
  ReservationForm get reservationForm;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<Failure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ReservationFormStateCopyWith<_ReservationFormState> get copyWith;
}
