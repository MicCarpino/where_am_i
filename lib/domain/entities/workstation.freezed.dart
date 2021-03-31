// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WorkstationTearOff {
  const _$WorkstationTearOff();

// ignore: unused_element
  _Workstation call(
      {int idWorkstation,
      String idResource,
      @required DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @required TimeOfDay startTime,
      @required TimeOfDay endTime,
      @required int status,
      bool hasMoreForCurrentMonth = false}) {
    return _Workstation(
      idWorkstation: idWorkstation,
      idResource: idResource,
      workstationDate: workstationDate,
      freeName: freeName,
      codeWorkstation: codeWorkstation,
      startTime: startTime,
      endTime: endTime,
      status: status,
      hasMoreForCurrentMonth: hasMoreForCurrentMonth,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Workstation = _$WorkstationTearOff();

/// @nodoc
mixin _$Workstation {
  int get idWorkstation;
  String get idResource;
  DateTime get workstationDate;
  String get freeName;
  String get codeWorkstation;
  TimeOfDay get startTime;
  TimeOfDay get endTime;
  int get status;
  bool get hasMoreForCurrentMonth;

  @JsonKey(ignore: true)
  $WorkstationCopyWith<Workstation> get copyWith;
}

/// @nodoc
abstract class $WorkstationCopyWith<$Res> {
  factory $WorkstationCopyWith(
          Workstation value, $Res Function(Workstation) then) =
      _$WorkstationCopyWithImpl<$Res>;
  $Res call(
      {int idWorkstation,
      String idResource,
      DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      TimeOfDay startTime,
      TimeOfDay endTime,
      int status,
      bool hasMoreForCurrentMonth});
}

/// @nodoc
class _$WorkstationCopyWithImpl<$Res> implements $WorkstationCopyWith<$Res> {
  _$WorkstationCopyWithImpl(this._value, this._then);

  final Workstation _value;
  // ignore: unused_field
  final $Res Function(Workstation) _then;

  @override
  $Res call({
    Object idWorkstation = freezed,
    Object idResource = freezed,
    Object workstationDate = freezed,
    Object freeName = freezed,
    Object codeWorkstation = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
    Object status = freezed,
    Object hasMoreForCurrentMonth = freezed,
  }) {
    return _then(_value.copyWith(
      idWorkstation: idWorkstation == freezed
          ? _value.idWorkstation
          : idWorkstation as int,
      idResource:
          idResource == freezed ? _value.idResource : idResource as String,
      workstationDate: workstationDate == freezed
          ? _value.workstationDate
          : workstationDate as DateTime,
      freeName: freeName == freezed ? _value.freeName : freeName as String,
      codeWorkstation: codeWorkstation == freezed
          ? _value.codeWorkstation
          : codeWorkstation as String,
      startTime:
          startTime == freezed ? _value.startTime : startTime as TimeOfDay,
      endTime: endTime == freezed ? _value.endTime : endTime as TimeOfDay,
      status: status == freezed ? _value.status : status as int,
      hasMoreForCurrentMonth: hasMoreForCurrentMonth == freezed
          ? _value.hasMoreForCurrentMonth
          : hasMoreForCurrentMonth as bool,
    ));
  }
}

/// @nodoc
abstract class _$WorkstationCopyWith<$Res>
    implements $WorkstationCopyWith<$Res> {
  factory _$WorkstationCopyWith(
          _Workstation value, $Res Function(_Workstation) then) =
      __$WorkstationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idWorkstation,
      String idResource,
      DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      TimeOfDay startTime,
      TimeOfDay endTime,
      int status,
      bool hasMoreForCurrentMonth});
}

/// @nodoc
class __$WorkstationCopyWithImpl<$Res> extends _$WorkstationCopyWithImpl<$Res>
    implements _$WorkstationCopyWith<$Res> {
  __$WorkstationCopyWithImpl(
      _Workstation _value, $Res Function(_Workstation) _then)
      : super(_value, (v) => _then(v as _Workstation));

  @override
  _Workstation get _value => super._value as _Workstation;

  @override
  $Res call({
    Object idWorkstation = freezed,
    Object idResource = freezed,
    Object workstationDate = freezed,
    Object freeName = freezed,
    Object codeWorkstation = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
    Object status = freezed,
    Object hasMoreForCurrentMonth = freezed,
  }) {
    return _then(_Workstation(
      idWorkstation: idWorkstation == freezed
          ? _value.idWorkstation
          : idWorkstation as int,
      idResource:
          idResource == freezed ? _value.idResource : idResource as String,
      workstationDate: workstationDate == freezed
          ? _value.workstationDate
          : workstationDate as DateTime,
      freeName: freeName == freezed ? _value.freeName : freeName as String,
      codeWorkstation: codeWorkstation == freezed
          ? _value.codeWorkstation
          : codeWorkstation as String,
      startTime:
          startTime == freezed ? _value.startTime : startTime as TimeOfDay,
      endTime: endTime == freezed ? _value.endTime : endTime as TimeOfDay,
      status: status == freezed ? _value.status : status as int,
      hasMoreForCurrentMonth: hasMoreForCurrentMonth == freezed
          ? _value.hasMoreForCurrentMonth
          : hasMoreForCurrentMonth as bool,
    ));
  }
}

/// @nodoc
class _$_Workstation extends _Workstation {
  const _$_Workstation(
      {this.idWorkstation,
      this.idResource,
      @required this.workstationDate,
      this.freeName,
      this.codeWorkstation,
      @required this.startTime,
      @required this.endTime,
      @required this.status,
      this.hasMoreForCurrentMonth = false})
      : assert(workstationDate != null),
        assert(startTime != null),
        assert(endTime != null),
        assert(status != null),
        assert(hasMoreForCurrentMonth != null),
        super._();

  @override
  final int idWorkstation;
  @override
  final String idResource;
  @override
  final DateTime workstationDate;
  @override
  final String freeName;
  @override
  final String codeWorkstation;
  @override
  final TimeOfDay startTime;
  @override
  final TimeOfDay endTime;
  @override
  final int status;
  @JsonKey(defaultValue: false)
  @override
  final bool hasMoreForCurrentMonth;

  @override
  String toString() {
    return 'Workstation(idWorkstation: $idWorkstation, idResource: $idResource, workstationDate: $workstationDate, freeName: $freeName, codeWorkstation: $codeWorkstation, startTime: $startTime, endTime: $endTime, status: $status, hasMoreForCurrentMonth: $hasMoreForCurrentMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Workstation &&
            (identical(other.idWorkstation, idWorkstation) ||
                const DeepCollectionEquality()
                    .equals(other.idWorkstation, idWorkstation)) &&
            (identical(other.idResource, idResource) ||
                const DeepCollectionEquality()
                    .equals(other.idResource, idResource)) &&
            (identical(other.workstationDate, workstationDate) ||
                const DeepCollectionEquality()
                    .equals(other.workstationDate, workstationDate)) &&
            (identical(other.freeName, freeName) ||
                const DeepCollectionEquality()
                    .equals(other.freeName, freeName)) &&
            (identical(other.codeWorkstation, codeWorkstation) ||
                const DeepCollectionEquality()
                    .equals(other.codeWorkstation, codeWorkstation)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.hasMoreForCurrentMonth, hasMoreForCurrentMonth) ||
                const DeepCollectionEquality().equals(
                    other.hasMoreForCurrentMonth, hasMoreForCurrentMonth)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idWorkstation) ^
      const DeepCollectionEquality().hash(idResource) ^
      const DeepCollectionEquality().hash(workstationDate) ^
      const DeepCollectionEquality().hash(freeName) ^
      const DeepCollectionEquality().hash(codeWorkstation) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(hasMoreForCurrentMonth);

  @JsonKey(ignore: true)
  @override
  _$WorkstationCopyWith<_Workstation> get copyWith =>
      __$WorkstationCopyWithImpl<_Workstation>(this, _$identity);
}

abstract class _Workstation extends Workstation {
  const _Workstation._() : super._();
  const factory _Workstation(
      {int idWorkstation,
      String idResource,
      @required DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @required TimeOfDay startTime,
      @required TimeOfDay endTime,
      @required int status,
      bool hasMoreForCurrentMonth}) = _$_Workstation;

  @override
  int get idWorkstation;
  @override
  String get idResource;
  @override
  DateTime get workstationDate;
  @override
  String get freeName;
  @override
  String get codeWorkstation;
  @override
  TimeOfDay get startTime;
  @override
  TimeOfDay get endTime;
  @override
  int get status;
  @override
  bool get hasMoreForCurrentMonth;
  @override
  @JsonKey(ignore: true)
  _$WorkstationCopyWith<_Workstation> get copyWith;
}
