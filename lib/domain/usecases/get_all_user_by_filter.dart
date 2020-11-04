import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

class GetAllUserByFilter extends UseCase<List<User>, String> {
  final UserRepository _userRepository;

  GetAllUserByFilter(this._userRepository);

  Future<Either<Failure, List<User>>> call(String filter) async {
    try {
      var allUsers = await _userRepository.getAllUsers();
      List<User> users = allUsers.fold(
          (failure) => null,
          (users) => users
              .where((user) =>
                  user.surname.toLowerCase().contains(filter.toLowerCase()) ||
                  user.name.toLowerCase().contains(filter.toLowerCase()))
              .toList());
      return users != null ? Right(users) : throw Exception;
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
