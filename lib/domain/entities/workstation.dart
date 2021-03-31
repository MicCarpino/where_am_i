import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/constants.dart';

part 'workstation.freezed.dart';

@freezed
abstract class Workstation implements _$Workstation {
  const Workstation._();

  const factory Workstation({
    int idWorkstation,
    String idResource,
    @required DateTime workstationDate,
    String freeName,
    String codeWorkstation,
    @required TimeOfDay startTime,
    @required TimeOfDay endTime,
    @required int status,
    @Default(false) bool hasMoreForCurrentMonth,
  }) = _Workstation;

  Workstation setWorkstationCode(String workstationCode) {
    return Workstation(
        idWorkstation: this.idWorkstation,
        idResource: this.idResource,
        workstationDate: this.workstationDate,
        freeName: this.freeName,
        codeWorkstation: workstationCode,
        startTime: this.startTime,
        endTime: this.endTime,
        status: this.status);
  }

  TimeSlot getTimeSlot() {
    if (this.startTime == TIME_SLOT_NINE &&
        this.endTime == TIME_SLOT_THIRTEEN) {
      return TimeSlot.morning;
    } else if (this.startTime == TIME_SLOT_FOURTEEN &&
        this.endTime == TIME_SLOT_EIGHTEEN) {
      return TimeSlot.evening;
    } else {
      return TimeSlot.fullDay;
    }
  }
}
