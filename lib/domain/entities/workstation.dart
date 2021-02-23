import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/constants.dart';

class Workstation extends Equatable {
  final int idWorkstation;
  final String idResource;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int status;
  final bool hasMoreForCurrentMonth;

  Workstation({
    @required this.idWorkstation,
    this.idResource,
    @required this.workstationDate,
    this.freeName,
    @required this.codeWorkstation,
    @required this.startTime,
    @required this.endTime,
    @required this.status,
    this.hasMoreForCurrentMonth = false,
  }) : assert(idResource != null || freeName != null);

  @override
  List<Object> get props => [
        idWorkstation,
        idResource,
        workstationDate,
        freeName,
        codeWorkstation,
        startTime,
        endTime,
        status,
        hasMoreForCurrentMonth,
      ];

  WorkstationModel toWorkstationModel() => WorkstationModel(
        idWorkstation: idWorkstation,
        idResource: idResource,
        workstationDate: workstationDate,
        freeName: freeName,
        codeWorkstation: codeWorkstation,
        startTime: startTime,
        endTime: endTime,
        status: status,
      );

  Workstation assignWorkstationCode(String workstationCode) {
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

  Workstation copyWith({
    idWorkstation,
    idResource,
    workstationDate,
    freeName,
    codeWorkstation,
    startTime,
    endTime,
    status,
    hasMoreForCurrentMonth,
  }) {
    return Workstation(
        idWorkstation: idWorkstation ?? this.idWorkstation,
        idResource: idResource ?? this.idResource,
        workstationDate: workstationDate ?? this.workstationDate,
        freeName: freeName ?? this.freeName,
        codeWorkstation: codeWorkstation ?? this.codeWorkstation,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        status: status ?? this.status);
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
