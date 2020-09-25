import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class GetLoggedUser implements UseCase<User, NoParams> {
  final LoginRepository loginRepository;
  GetLoggedUser(this.loginRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async{
    return await loginRepository.getLoggedUser();
  }
}