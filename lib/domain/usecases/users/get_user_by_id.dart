import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

class GetUserById extends UseCase<User, String> {
  final UserRepository _userRepository;

  GetUserById(this._userRepository);

  Future<Either<Failure, User>> call(String idResource) async {
    try {
      var allUsers = await _userRepository.getAllUsers();
      User user = allUsers.fold(
          (failure) => null,
          (users) =>
              users.singleWhere((element) => element.idResource == idResource));
      return user != null ? Right(user) : throw Exception;
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
