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
  }) : super(
      idWorkstation: idWorkstation,
      idResource: idResource,
      workstationDate: workstationDate,
      freeName: freeName,
      codeWorkstation: codeWorkstation);

  factory WorkstationModel.fromJson(Map<String, dynamic> json) {
    return WorkstationModel(
        idWorkstation: json['idWorkstation'],
        idResource: json['idResource'].toString(),
        workstationDate:(DateTime.parse(json['workstationDate'])),
        freeName: json['freeName'],
        codeWorkstation: json['codeWorkstation']);
  }

  Map<String, dynamic> toJson() =>
      {
        'idWorkstation': idWorkstation,
        'idResource': idResource,
        'workstationDate': DateFormat('yyyy-MM-dd').format(workstationDate),
        'freeName': freeName,
        'codeWorkstation': codeWorkstation,
      };

  Map<String, String> toQueryParams() {
    var queryParams = Map<String, String>();
    idWorkstation != null ? queryParams['idWorkstation'] = idWorkstation.toString() : null;
    codeWorkstation != null ? queryParams['codeWorkstation'] = codeWorkstation : null;
    idResource != null ? queryParams['idResource'] = idResource : null;
    freeName != null ? queryParams['freeName'] = freeName : null;
    workstationDate != null? queryParams['workstationDate'] =
        DateFormat('yyyy-MM-dd').format(workstationDate) : null;
    return queryParams;
  }
}
