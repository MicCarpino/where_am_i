import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final UserDetails userDetails;
  final String authenticationToken;
  final int expiration;

  User({
    @required this.userDetails,
    @required this.authenticationToken,
    @required this.expiration,
  });

  @override
  List<Object> get props => [userDetails, authenticationToken, expiration];
}

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
