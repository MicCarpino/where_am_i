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
        idWorkstation: json["idWorkstation"],
        idResource: json["idResource"].toString(),
        workstationDate: DateTime.parse(json["workstationDate"]),
        freeName: json["freeName"],
        codeWorkstation: json["codeWorkstation"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'idWorkstation': idWorkstation,
      'idResource': idResource,
      'workstationDate': workstationDate,
      'freeName': freeName,
      'codeWorkstation': codeWorkstation,
    };
  }
}
