import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String idResource;
  final int idRole;
  final String username;
  final String name;
  final String surname;

  User({
    @required this.idResource,
    @required this.idRole,
    @required this.username,
    @required this.name,
    @required this.surname,
  });

  @override
  List<Object> get props => [idResource, idRole, username, name, surname];
}
