import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

class GetAllUserByFilter extends UseCase<List<User>, String> {
  final UserRepository _userRepository;

  GetAllUserByFilter(this._userRepository);

  Future<Either<Failure, List<User>>> call(String filter) async {
    var allUsers = await _userRepository.getAllUsers();
    return allUsers.fold((failure) => Left(failure), (users) {
      return Right(users
          .where((user) =>
              user.surname.toLowerCase().contains(filter.toLowerCase()) ||
              user.name.toLowerCase().contains(filter.toLowerCase()))
          .toList());
    });
  }
}
