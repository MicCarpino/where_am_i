import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/authenticated_user.dart';
import '../repositories/auth_repository.dart';

class GetLoggedUser implements UseCase<AuthenticatedUser, NoParams> {
  final AuthRepository loginRepository;
  GetLoggedUser(this.loginRepository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(NoParams params) async{
    return await loginRepository.getLoggedUser();
  }
}