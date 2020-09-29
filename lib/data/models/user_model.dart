import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    @required String idResource,
    @required int idRole,
    @required String username,
    @required String name,
    @required String surname,
  }) : super(
          idResource: idResource,
          idRole: idRole,
          username: username,
          name: name,
          surname: surname,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idResource: json['idResource'],
      idRole: json['idRole'],
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idResource': idResource,
      'idRole': idRole,
      'username': username,
      'surname': surname,
      'name': name
    };
  }
}
