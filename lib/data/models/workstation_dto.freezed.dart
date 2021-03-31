// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'workstation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WorkstationDto _$WorkstationDtoFromJson(Map<String, dynamic> json) {
  return _WorkstationDto.fromJson(json);
}

/// @nodoc
class _$WorkstationDtoTearOff {
  const _$WorkstationDtoTearOff();

// ignore: unused_element
  _WorkstationDto call(
      {int idWorkstation,
      int idResource,
      @required @DateTimeConverter() DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      int status = 0,
      bool hasMoreForCurrentMonth = false}) {
    return _WorkstationDto(
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

// ignore: unused_element
  WorkstationDto fromJson(Map<String, Object> json) {
    return WorkstationDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $WorkstationDto = _$WorkstationDtoTearOff();

/// @nodoc
mixin _$WorkstationDto {
  int get idWorkstation;
  int get idResource;
  @DateTimeConverter()
  DateTime get workstationDate;
  String get freeName;
  String get codeWorkstation;
  @TimeOfDayConverter()
  TimeOfDay get startTime;
  @TimeOfDayConverter()
  TimeOfDay get endTime;
  int get status;
  bool get hasMoreForCurrentMonth;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $WorkstationDtoCopyWith<WorkstationDto> get copyWith;
}

/// @nodoc
abstract class $WorkstationDtoCopyWith<$Res> {
  factory $WorkstationDtoCopyWith(
          WorkstationDto value, $Res Function(WorkstationDto) then) =
      _$WorkstationDtoCopyWithImpl<$Res>;
  $Res call(
      {int idWorkstation,
      int idResource,
      @DateTimeConverter() DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      int status,
      bool hasMoreForCurrentMonth});
}

/// @nodoc
class _$WorkstationDtoCopyWithImpl<$Res>
    implements $WorkstationDtoCopyWith<$Res> {
  _$WorkstationDtoCopyWithImpl(this._value, this._then);

  final WorkstationDto _value;
  // ignore: unused_field
  final $Res Function(WorkstationDto) _then;

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
      idResource: idResource == freezed ? _value.idResource : idResource as int,
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
abstract class _$WorkstationDtoCopyWith<$Res>
    implements $WorkstationDtoCopyWith<$Res> {
  factory _$WorkstationDtoCopyWith(
          _WorkstationDto value, $Res Function(_WorkstationDto) then) =
      __$WorkstationDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idWorkstation,
      int idResource,
      @DateTimeConverter() DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      int status,
      bool hasMoreForCurrentMonth});
}

/// @nodoc
class __$WorkstationDtoCopyWithImpl<$Res>
    extends _$WorkstationDtoCopyWithImpl<$Res>
    implements _$WorkstationDtoCopyWith<$Res> {
  __$WorkstationDtoCopyWithImpl(
      _WorkstationDto _value, $Res Function(_WorkstationDto) _then)
      : super(_value, (v) => _then(v as _WorkstationDto));

  @override
  _WorkstationDto get _value => super._value as _WorkstationDto;

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
    return _then(_WorkstationDto(
      idWorkstation: idWorkstation == freezed
          ? _value.idWorkstation
          : idWorkstation as int,
      idResource: idResource == freezed ? _value.idResource : idResource as int,
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

@JsonSerializable()

/// @nodoc
class _$_WorkstationDto extends _WorkstationDto {
  const _$_WorkstationDto(
      {this.idWorkstation,
      this.idResource,
      @required @DateTimeConverter() this.workstationDate,
      this.freeName,
      this.codeWorkstation,
      @TimeOfDayConverter() this.startTime,
      @TimeOfDayConverter() this.endTime,
      this.status = 0,
      this.hasMoreForCurrentMonth = false})
      : assert(workstationDate != null),
        assert(status != null),
        assert(hasMoreForCurrentMonth != null),
        super._();

  factory _$_WorkstationDto.fromJson(Map<String, dynamic> json) =>
      _$_$_WorkstationDtoFromJson(json);

  @override
  final int idWorkstation;
  @override
  final int idResource;
  @override
  @DateTimeConverter()
  final DateTime workstationDate;
  @override
  final String freeName;
  @override
  final String codeWorkstation;
  @override
  @TimeOfDayConverter()
  final TimeOfDay startTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay endTime;
  @JsonKey(defaultValue: 0)
  @override
  final int status;
  @JsonKey(defaultValue: false)
  @override
  final bool hasMoreForCurrentMonth;

  @override
  String toString() {
    return 'WorkstationDto(idWorkstation: $idWorkstation, idResource: $idResource, workstationDate: $workstationDate, freeName: $freeName, codeWorkstation: $codeWorkstation, startTime: $startTime, endTime: $endTime, status: $status, hasMoreForCurrentMonth: $hasMoreForCurrentMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkstationDto &&
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
  _$WorkstationDtoCopyWith<_WorkstationDto> get copyWith =>
      __$WorkstationDtoCopyWithImpl<_WorkstationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WorkstationDtoToJson(this);
  }
}

abstract class _WorkstationDto extends WorkstationDto {
  const _WorkstationDto._() : super._();
  const factory _WorkstationDto(
      {int idWorkstation,
      int idResource,
      @required @DateTimeConverter() DateTime workstationDate,
      String freeName,
      String codeWorkstation,
      @TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime,
      int status,
      bool hasMoreForCurrentMonth}) = _$_WorkstationDto;

  factory _WorkstationDto.fromJson(Map<String, dynamic> json) =
      _$_WorkstationDto.fromJson;

  @override
  int get idWorkstation;
  @override
  int get idResource;
  @override
  @DateTimeConverter()
  DateTime get workstationDate;
  @override
  String get freeName;
  @override
  String get codeWorkstation;
  @override
  @TimeOfDayConverter()
  TimeOfDay get startTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get endTime;
  @override
  int get status;
  @override
  bool get hasMoreForCurrentMonth;
  @override
  @JsonKey(ignore: true)
  _$WorkstationDtoCopyWith<_WorkstationDto> get copyWith;
}
