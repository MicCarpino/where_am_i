import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user.dart';

import '../../core/error/failure.dart';

abstract class UserRepository {

  Future<Either<Failure, List<User>>> getAllUsers();

  Future<Either<Failure,List<User>>> updateUser(User user);
}
