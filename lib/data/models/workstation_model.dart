import 'package:where_am_i/domain/entities/workstation.dart';

class WorkstationModel extends Workstation {
  final int idWorkstation;
  final int idResource;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;

  WorkstationModel(
      {this.idWorkstation,
      this.idResource,
      this.workstationDate,
      this.freeName,
      this.codeWorkstation});

  factory WorkstationModel.fromJson(Map<String, dynamic> json) {
    return WorkstationModel(
        idWorkstation: json["idWorkstation"],
        idResource: json["idResource"],
        workstationDate: json["workstationDate"],
        freeName: json["freeName"],
        codeWorkstation: json["codeWorkstation"]);
  }
}
