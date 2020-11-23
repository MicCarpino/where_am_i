import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class WorkstationModel extends Workstation {
  WorkstationModel({
    @required idWorkstation,
    @required idResource,
    @required workstationDate,
    @required freeName,
    @required codeWorkstation,
    @required startTime,
    @required endTime,
    @required status,
    @required hasMoreForCurrentMoth,
  }) : super(
    idWorkstation: idWorkstation,
    idResource: idResource,
    workstationDate: workstationDate,
    freeName: freeName,
    codeWorkstation: codeWorkstation,
    startTime: startTime,
    endTime: endTime,
    status: status,
    hasMoreForCurrentMoth: hasMoreForCurrentMoth,
  );

  factory WorkstationModel.fromJson(Map<String, dynamic> json) {
    final format = DateFormat.Hms();
    return WorkstationModel(
        idWorkstation: json['idWorkstation'],
        idResource:
        json['idResource'] is int ? json['idResource'].toString() : null,
        workstationDate: (DateTime.parse(json['workstationDate'])),
        freeName: json['freeName'],
        codeWorkstation: json['codeWorkstation'],
        startTime: json['startTime'] != null ? TimeOfDay.fromDateTime(
            format.parse(json['startTime']))
            : TimeOfDay(hour: 9, minute: 0),
        endTime: json['endTime'] != null ? TimeOfDay.fromDateTime(
            format.parse(json['endTime']))
            : TimeOfDay(hour: 18, minute: 0),
        status: json['status'] ?? 0,
    hasMoreForCurrentMoth: json['hasMoreForCurrentMoth'] ?? null
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'idWorkstation': idWorkstation,
        'idResource': idResource,
        'workstationDate': DateFormat('yyyy-MM-dd').format(workstationDate),
        'freeName': freeName,
        'codeWorkstation': codeWorkstation,
        'startTime': startTime.toString(),
        'endTime': endTime.toString(),
        'status': status,
        'hasMoreForCurrentMoth': hasMoreForCurrentMoth,
      };
}
