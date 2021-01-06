import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';


class GetLoggedUser implements UseCase<AuthenticatedUser, NoParams> {
  final AuthenticationRepository _loginRepository;
  GetLoggedUser(this._loginRepository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(NoParams params) async{
    return await _loginRepository.getLoggedUser();
  }
}