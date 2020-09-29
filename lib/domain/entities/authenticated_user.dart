import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/user.dart';

class AuthenticatedUser extends Equatable {
  final User userDetails;
  final String authenticationToken;
  final int expiration;

  AuthenticatedUser({
    @required this.userDetails,
    @required this.authenticationToken,
    @required this.expiration,
  });

  @override
  List<Object> get props => [userDetails, authenticationToken, expiration];
}