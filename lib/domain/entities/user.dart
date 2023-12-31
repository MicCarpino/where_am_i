import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/user_model.dart';

class User extends Equatable {
  final String idResource;
  final int idRole;
  final String name;
  final String surname;

  User({
    @required this.idResource,
    @required this.idRole,
    @required this.name,
    @required this.surname,
  });

  @override
  List<Object> get props => [idResource, idRole, name, surname];

  UserModel toUserModel() => UserModel(
      idResource: idResource, idRole: idRole, name: name, surname: surname);

  bool isStaffOrAdmin() {
    return this.idRole >= ROLE_STAFF;
  }

  String getSurnameAndName() {
    return '$surname $name';
  }

  User copyWith({String idResource, int idRole, String name, String surname}) {
    return User(
      idResource: idResource ?? this.idResource,
      idRole: idRole ?? this.idRole,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
