import 'package:meta/meta.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUser {
  AuthenticatedUserModel(
      {@required UserModel user,
        @required String authenticationToken,
        @required int expiration})
      : super(
      user: user,
      authenticationToken: authenticationToken,
      expiration: expiration);

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticatedUserModel(
      user: UserModel.fromJson(json['user']),
      authenticationToken: json['token'],
      expiration: json['expiration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': (user as UserModel).toJson(),
      'token': authenticationToken,
      'expiration': expiration
    };
  }
}