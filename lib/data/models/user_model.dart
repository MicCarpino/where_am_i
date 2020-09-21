import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {@required UserDetailsModel userDetails,
      @required String authenticationToken,
      @required int expiration})
      : super(
            userDetails: userDetails,
            authenticationToken: authenticationToken,
            expiration: expiration);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userDetails: UserDetailsModel.fromJson(json['user']),
      authenticationToken: json['token'],
      expiration: json['expiration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': (userDetails as UserDetailsModel).toJson(),
      'token': authenticationToken,
      'expiration': expiration
    };
  }
}

class UserDetailsModel extends UserDetails {
  UserDetailsModel({
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

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
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
