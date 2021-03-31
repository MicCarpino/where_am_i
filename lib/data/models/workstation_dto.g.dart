// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workstation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkstationDto _$_$_WorkstationDtoFromJson(Map<String, dynamic> json) {
  return _$_WorkstationDto(
    idWorkstation: json['idWorkstation'] as int,
    idResource: json['idResource'] as int,
    workstationDate:
        const DateTimeConverter().fromJson(json['workstationDate']),
    freeName: json['freeName'] as String,
    codeWorkstation: json['codeWorkstation'] as String,
    startTime: const TimeOfDayConverter().fromJson(json['startTime']),
    endTime: const TimeOfDayConverter().fromJson(json['endTime']),
    status: json['status'] as int ?? 0,
    hasMoreForCurrentMonth: json['hasMoreForCurrentMonth'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_WorkstationDtoToJson(_$_WorkstationDto instance) =>
    <String, dynamic>{
      'idWorkstation': instance.idWorkstation,
      'idResource': instance.idResource,
      'workstationDate':
          const DateTimeConverter().toJson(instance.workstationDate),
      'freeName': instance.freeName,
      'codeWorkstation': instance.codeWorkstation,
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
      'status': instance.status,
      'hasMoreForCurrentMonth': instance.hasMoreForCurrentMonth,
    };
