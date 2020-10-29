import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/authenticated_user.dart';
import '../repositories/auth_repository.dart';

class GetLoggedUser implements UseCase<AuthenticatedUser, NoParams> {
  final AuthRepository _loginRepository;
  GetLoggedUser(this._loginRepository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(NoParams params) async{
    return await _loginRepository.getLoggedUser();
  }
}