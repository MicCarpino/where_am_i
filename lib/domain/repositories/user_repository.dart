import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/user.dart';

abstract class UserRepository {

  Future<Either<Failure, List<User>>> getAllUsers();

  Future<Either<Failure,List<User>>> updateUser(User user);
}
