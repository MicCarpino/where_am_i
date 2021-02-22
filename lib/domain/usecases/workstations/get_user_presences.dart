import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';

import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class GetUserPresences extends UseCase<List<Workstation>, NoParams> {
  final WorkstationRepository _workstationRepository;
  final AuthenticationRepository _authRepository;

  GetUserPresences(this._workstationRepository, this._authRepository);

  Future<Either<Failure, List<Workstation>>> call(NoParams params) async {
    var loggedUser = await _authRepository.getLoggedUser();
    return loggedUser.fold(
        (l) => Left(l),
        (r) => _workstationRepository
            .getAllForCurrentUser());
  }
}
