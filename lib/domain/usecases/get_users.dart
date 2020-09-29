import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetUsers extends UseCase<List<User>, void> {
  final UserRepository userRepository;

  GetUsers(this.userRepository);

  Future<Either<Failure, List<User>>> call(void params) async {
    return await userRepository.getAllUsers();
  }
}
