import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

part 'workstation_dto.freezed.dart';

part 'workstation_dto.g.dart';

@freezed
abstract class WorkstationDto with _$WorkstationDto {
  const WorkstationDto._();

  const factory WorkstationDto({
    int idWorkstation,
    int idResource,
    @required @DateTimeConverter() DateTime workstationDate,
    String freeName,
    String codeWorkstation,
    @TimeOfDayConverter() TimeOfDay startTime,
    @TimeOfDayConverter() TimeOfDay endTime,
    @Default(0) int status,
    @Default(false) bool hasMoreForCurrentMonth,
  }) = _WorkstationDto;

  factory WorkstationDto.fromDomain(Workstation workstation) {
    return WorkstationDto(
      idWorkstation: workstation.idWorkstation,
      idResource: workstation.idResource != null
          ? int.tryParse(workstation.idResource)
          : null,
      workstationDate: workstation.workstationDate,
      freeName: workstation.freeName,
      codeWorkstation: workstation.codeWorkstation,
      startTime: workstation.startTime,
      endTime: workstation.endTime,
      status: workstation.status,
    );
  }

  Workstation toDomain() {
    return Workstation(
      idWorkstation: idWorkstation,
      idResource: idResource != null ? idResource.toString() : null,
      freeName: freeName,
      workstationDate: workstationDate,
      codeWorkstation: codeWorkstation,
      startTime: startTime ?? TimeOfDay(hour: 9, minute: 0),
      endTime: endTime ?? TimeOfDay(hour: 18, minute: 0),
      status: status,
      hasMoreForCurrentMonth: hasMoreForCurrentMonth,
    );
  }

  factory WorkstationDto.fromJson(Map<String, dynamic> json) =>
      _$WorkstationDtoFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, Object> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Object json) {
    return DateTime.parse(json);
  }

  @override
  Object toJson(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, Object> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Object json) {
    return json != null
        ? TimeOfDay.fromDateTime(DateFormat.Hms().parse(json))
        : null;
  }

  @override
  Object toJson(TimeOfDay dateTime) => dateTime.toJson();
}
