import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';


class GetAllUsers extends UseCase<List<User>, NoParams> {
  final UserRepository _userRepository;

  GetAllUsers(this._userRepository);

  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await _userRepository.getAllUsers();
  }
}
