// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reservation_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ReservationFormTearOff {
  const _$ReservationFormTearOff();

// ignore: unused_element
  _ReservationForm call(
      {int idReservation,
      @required int idRoom,
      @required DateTime date,
      @required int idHandler,
      List<String> participants,
      int status,
      @required SubjectForm subjectForm,
      @required TimeForm startTimeForm,
      @required TimeForm endTimeForm}) {
    return _ReservationForm(
      idReservation: idReservation,
      idRoom: idRoom,
      date: date,
      idHandler: idHandler,
      participants: participants,
      status: status,
      subjectForm: subjectForm,
      startTimeForm: startTimeForm,
      endTimeForm: endTimeForm,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ReservationForm = _$ReservationFormTearOff();

/// @nodoc
mixin _$ReservationForm {
  int get idReservation;
  int get idRoom;
  DateTime get date;
  int get idHandler;
  List<String> get participants;
  int get status;
  SubjectForm get subjectForm;
  TimeForm get startTimeForm;
  TimeForm get endTimeForm;

  @JsonKey(ignore: true)
  $ReservationFormCopyWith<ReservationForm> get copyWith;
}

/// @nodoc
abstract class $ReservationFormCopyWith<$Res> {
  factory $ReservationFormCopyWith(
          ReservationForm value, $Res Function(ReservationForm) then) =
      _$ReservationFormCopyWithImpl<$Res>;
  $Res call(
      {int idReservation,
      int idRoom,
      DateTime date,
      int idHandler,
      List<String> participants,
      int status,
      SubjectForm subjectForm,
      TimeForm startTimeForm,
      TimeForm endTimeForm});
}

/// @nodoc
class _$ReservationFormCopyWithImpl<$Res>
    implements $ReservationFormCopyWith<$Res> {
  _$ReservationFormCopyWithImpl(this._value, this._then);

  final ReservationForm _value;
  // ignore: unused_field
  final $Res Function(ReservationForm) _then;

  @override
  $Res call({
    Object idReservation = freezed,
    Object idRoom = freezed,
    Object date = freezed,
    Object idHandler = freezed,
    Object participants = freezed,
    Object status = freezed,
    Object subjectForm = freezed,
    Object startTimeForm = freezed,
    Object endTimeForm = freezed,
  }) {
    return _then(_value.copyWith(
      idReservation: idReservation == freezed
          ? _value.idReservation
          : idReservation as int,
      idRoom: idRoom == freezed ? _value.idRoom : idRoom as int,
      date: date == freezed ? _value.date : date as DateTime,
      idHandler: idHandler == freezed ? _value.idHandler : idHandler as int,
      participants: participants == freezed
          ? _value.participants
          : participants as List<String>,
      status: status == freezed ? _value.status : status as int,
      subjectForm: subjectForm == freezed
          ? _value.subjectForm
          : subjectForm as SubjectForm,
      startTimeForm: startTimeForm == freezed
          ? _value.startTimeForm
          : startTimeForm as TimeForm,
      endTimeForm:
          endTimeForm == freezed ? _value.endTimeForm : endTimeForm as TimeForm,
    ));
  }
}

/// @nodoc
abstract class _$ReservationFormCopyWith<$Res>
    implements $ReservationFormCopyWith<$Res> {
  factory _$ReservationFormCopyWith(
          _ReservationForm value, $Res Function(_ReservationForm) then) =
      __$ReservationFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idReservation,
      int idRoom,
      DateTime date,
      int idHandler,
      List<String> participants,
      int status,
      SubjectForm subjectForm,
      TimeForm startTimeForm,
      TimeForm endTimeForm});
}

/// @nodoc
class __$ReservationFormCopyWithImpl<$Res>
    extends _$ReservationFormCopyWithImpl<$Res>
    implements _$ReservationFormCopyWith<$Res> {
  __$ReservationFormCopyWithImpl(
      _ReservationForm _value, $Res Function(_ReservationForm) _then)
      : super(_value, (v) => _then(v as _ReservationForm));

  @override
  _ReservationForm get _value => super._value as _ReservationForm;

  @override
  $Res call({
    Object idReservation = freezed,
    Object idRoom = freezed,
    Object date = freezed,
    Object idHandler = freezed,
    Object participants = freezed,
    Object status = freezed,
    Object subjectForm = freezed,
    Object startTimeForm = freezed,
    Object endTimeForm = freezed,
  }) {
    return _then(_ReservationForm(
      idReservation: idReservation == freezed
          ? _value.idReservation
          : idReservation as int,
      idRoom: idRoom == freezed ? _value.idRoom : idRoom as int,
      date: date == freezed ? _value.date : date as DateTime,
      idHandler: idHandler == freezed ? _value.idHandler : idHandler as int,
      participants: participants == freezed
          ? _value.participants
          : participants as List<String>,
      status: status == freezed ? _value.status : status as int,
      subjectForm: subjectForm == freezed
          ? _value.subjectForm
          : subjectForm as SubjectForm,
      startTimeForm: startTimeForm == freezed
          ? _value.startTimeForm
          : startTimeForm as TimeForm,
      endTimeForm:
          endTimeForm == freezed ? _value.endTimeForm : endTimeForm as TimeForm,
    ));
  }
}

/// @nodoc
class _$_ReservationForm extends _ReservationForm {
  const _$_ReservationForm(
      {this.idReservation,
      @required this.idRoom,
      @required this.date,
      @required this.idHandler,
      this.participants,
      this.status,
      @required this.subjectForm,
      @required this.startTimeForm,
      @required this.endTimeForm})
      : assert(idRoom != null),
        assert(date != null),
        assert(idHandler != null),
        assert(subjectForm != null),
        assert(startTimeForm != null),
        assert(endTimeForm != null),
        super._();

  @override
  final int idReservation;
  @override
  final int idRoom;
  @override
  final DateTime date;
  @override
  final int idHandler;
  @override
  final List<String> participants;
  @override
  final int status;
  @override
  final SubjectForm subjectForm;
  @override
  final TimeForm startTimeForm;
  @override
  final TimeForm endTimeForm;

  @override
  String toString() {
    return 'ReservationForm(idReservation: $idReservation, idRoom: $idRoom, date: $date, idHandler: $idHandler, participants: $participants, status: $status, subjectForm: $subjectForm, startTimeForm: $startTimeForm, endTimeForm: $endTimeForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReservationForm &&
            (identical(other.idReservation, idReservation) ||
                const DeepCollectionEquality()
                    .equals(other.idReservation, idReservation)) &&
            (identical(other.idRoom, idRoom) ||
                const DeepCollectionEquality().equals(other.idRoom, idRoom)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.idHandler, idHandler) ||
                const DeepCollectionEquality()
                    .equals(other.idHandler, idHandler)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.subjectForm, subjectForm) ||
                const DeepCollectionEquality()
                    .equals(other.subjectForm, subjectForm)) &&
            (identical(other.startTimeForm, startTimeForm) ||
                const DeepCollectionEquality()
                    .equals(other.startTimeForm, startTimeForm)) &&
            (identical(other.endTimeForm, endTimeForm) ||
                const DeepCollectionEquality()
                    .equals(other.endTimeForm, endTimeForm)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idReservation) ^
      const DeepCollectionEquality().hash(idRoom) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(idHandler) ^
      const DeepCollectionEquality().hash(participants) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(subjectForm) ^
      const DeepCollectionEquality().hash(startTimeForm) ^
      const DeepCollectionEquality().hash(endTimeForm);

  @JsonKey(ignore: true)
  @override
  _$ReservationFormCopyWith<_ReservationForm> get copyWith =>
      __$ReservationFormCopyWithImpl<_ReservationForm>(this, _$identity);
}

abstract class _ReservationForm extends ReservationForm {
  const _ReservationForm._() : super._();
  const factory _ReservationForm(
      {int idReservation,
      @required int idRoom,
      @required DateTime date,
      @required int idHandler,
      List<String> participants,
      int status,
      @required SubjectForm subjectForm,
      @required TimeForm startTimeForm,
      @required TimeForm endTimeForm}) = _$_ReservationForm;

  @override
  int get idReservation;
  @override
  int get idRoom;
  @override
  DateTime get date;
  @override
  int get idHandler;
  @override
  List<String> get participants;
  @override
  int get status;
  @override
  SubjectForm get subjectForm;
  @override
  TimeForm get startTimeForm;
  @override
  TimeForm get endTimeForm;
  @override
  @JsonKey(ignore: true)
  _$ReservationFormCopyWith<_ReservationForm> get copyWith;
}
