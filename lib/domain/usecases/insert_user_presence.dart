import 'package:dartz/dartz.dart';

import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class InsertUserPresence extends UseCase<Workstation, NewPresenceParams> {
  final WorkstationRepository _workstationRepository;
  final AuthRepository _authRepository;

  InsertUserPresence(this._workstationRepository, this._authRepository);

  Future<Either<Failure, Workstation>> call(
      NewPresenceParams newWorkstationParams) async {
    var currentUser = await _authRepository.getLoggedUser();
    User loggedUser = currentUser.getOrElse(() => null).user;
    if (loggedUser != null) {
      var newWorkstation = Workstation(
        idWorkstation: null,
        workstationDate: newWorkstationParams.date,
        codeWorkstation: null,
        startTime: newWorkstationParams.startTime,
        endTime: newWorkstationParams.endTime,
        idResource: loggedUser.idResource,
      );
      // performing remote insert
      return await _workstationRepository.insertWorkstation(newWorkstation);
    } else {
      return Left(CacheFailure());
    }
  }
}
