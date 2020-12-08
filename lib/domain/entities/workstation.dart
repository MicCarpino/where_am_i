import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/data/models/workstation_model.dart';

class Workstation extends Equatable {
  final int idWorkstation;
  final String idResource;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int status;
  final bool hasMoreForCurrentMoth;

  Workstation({
    @required this.idWorkstation,
    this.idResource,
    @required this.workstationDate,
    this.freeName,
    @required this.codeWorkstation,
    @required this.startTime,
    @required this.endTime,
    @required this.status,
    this.hasMoreForCurrentMoth = false,
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
        hasMoreForCurrentMoth,
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
}
