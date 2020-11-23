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
    @required hasMoreForCurrentMoth,
  }) : super(
          idWorkstation: idWorkstation,
          idResource: idResource,
          workstationDate: workstationDate,
          freeName: freeName,
          codeWorkstation: codeWorkstation,
          startTime: startTime,
          endTime: endTime,
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
        startTime: json['startTime'] != null
            ? TimeOfDay.fromDateTime(format.parse(json['startTime']))
            : null,
        endTime: json['endTime'] != null
            ? TimeOfDay.fromDateTime(format.parse(json['endTime']))
            : null,
        hasMoreForCurrentMoth: json['hasMoreForCurrentMoth'] ?? null);
  }

  Map<String, dynamic> toJson() => {
        'idWorkstation': idWorkstation,
        'idResource': idResource,
        'workstationDate': DateFormat('yyyy-MM-dd').format(workstationDate),
        'freeName': freeName,
        'codeWorkstation': codeWorkstation,
        'startTime': startTime.toString(),
        'endTime': endTime.toString(),
        'hasMoreForCurrentMoth': hasMoreForCurrentMoth,
      };

  Map<String, String> toQueryParams() {
    var queryParams = Map<String, String>();
    if (idWorkstation != null) {
      queryParams['idWorkstation'] = idWorkstation.toString();
    }
    if (codeWorkstation != null) {
      queryParams['codeWorkstation'] = codeWorkstation;
    }
    if (idResource != null) {
      queryParams['idResource'] = idResource;
    }
    if (freeName != null) {
      queryParams['freeName'] = freeName;
    }
    if (workstationDate != null) {
      queryParams['workstationDate'] =
          DateFormat('yyyy-MM-dd').format(workstationDate);
    }
    return queryParams;
  }
}
