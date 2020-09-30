import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class WorkstationModel extends Workstation {
  final int idWorkstation;
  final String idResource;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;

  WorkstationModel(
      {@required this.idWorkstation,
      @required this.idResource,
      @required this.workstationDate,
      @required this.freeName,
      @required this.codeWorkstation});

  factory WorkstationModel.fromJson(Map<String, dynamic> json) {
    return WorkstationModel(
        idWorkstation: json["idWorkstation"],
        idResource: json["idResource"].toString(),
        workstationDate: DateTime.parse(json["workstationDate"]),
        freeName: json["freeName"],
        codeWorkstation: json["codeWorkstation"]);
  }
}
