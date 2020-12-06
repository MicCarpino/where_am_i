import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class UserWithWorkstation extends Equatable {
  final User user;
  final Workstation workstation;

  UserWithWorkstation({
    @required this.user,
    @required this.workstation,
  });

  @override
  List<Object> get props => [user, workstation];

  String getResourceLabel() {
    String label;
    if (this.user != null) {
      label = "${this.user.surname} ${this.user.name}";
    } else if (this.workstation.freeName != null) {
      label = this.workstation.freeName;
    } else {
      label = "N/A";
    }
    return label;
  }
}
