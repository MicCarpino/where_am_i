import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final int idResource;
  final int idRole;
  final String name;
  final String surname;
  final int idWorkstation;

  User({
    @required this.idResource,
    @required this.idRole,
    @required this.name,
    @required this.surname,
    this.idWorkstation,
  });

  @override
  List<Object> get props => [idResource, idRole, name, surname];
}
