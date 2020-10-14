import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Workstation extends Equatable {
  final int idWorkstation;
  final int idResource;
  final String resourceName;
  final String resourceSurname;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;

  Workstation({
    @required this.idWorkstation,
    this.idResource,
    this.resourceName,
    this.resourceSurname,
    @required this.workstationDate,
    this.freeName,
    @required this.codeWorkstation,
  });

  @override
  List<Object> get props =>
      [
        idWorkstation,
        idResource,
        resourceName,
        resourceSurname,
        workstationDate,
        freeName,
        codeWorkstation
      ];
}
