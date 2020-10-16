import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Workstation extends Equatable {
  final int idWorkstation;
  final String idResource;
  final DateTime workstationDate;
  final String freeName;
  final String codeWorkstation;

  Workstation({
    @required this.idWorkstation,
    this.idResource,
    @required this.workstationDate,
    this.freeName,
    @required this.codeWorkstation,
  });

  @override
  List<Object> get props =>
      [
        idWorkstation,
        idResource,
        workstationDate,
        freeName,
        codeWorkstation
      ];
}
