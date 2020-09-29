import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/home_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetUsers extends UseCase<List<User>, void> {
  final HomeRepository homeRepository;

  GetUsers(this.homeRepository);

  Future<Either<Failure, List<User>>> call(void params) async {
    return await homeRepository.getUsers();
  }
}
