import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class UpdateUser extends UseCase<List<User>, User> {
  final UserRepository _userRepository;

  UpdateUser(this._userRepository);

  Future<Either<Failure, List<User>>> call(User updatedUser) async {
    return await _userRepository.updateUser(updatedUser);
  }
}
