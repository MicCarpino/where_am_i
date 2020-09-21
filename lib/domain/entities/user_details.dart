import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserDetails extends Equatable {
  final String idResource;
  final int idRole;
  final String username;
  final String name;
  final String surname;

  UserDetails({
    @required this.idResource,
    @required this.idRole,
    @required this.username,
    @required this.name,
    @required this.surname,
  });

  @override
  List<Object> get props => [idResource, idRole, username, name, surname];
}
