import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';

import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';


class InsertUserPresence extends UseCase<Workstation, PresenceNewParameters> {
  final WorkstationRepository _workstationRepository;
  final AuthRepository _authRepository;

  InsertUserPresence(this._workstationRepository, this._authRepository);

  Future<Either<Failure, Workstation>> call(
      PresenceNewParameters newWorkstationParams) async {
    var currentUser = await _authRepository.getLoggedUser();
    User loggedUser = currentUser.getOrElse(() => null).user;
      var newWorkstation = Workstation(
        idWorkstation: null,
        workstationDate: newWorkstationParams.date,
        codeWorkstation: null,
        startTime: newWorkstationParams.startTime,
        endTime: newWorkstationParams.endTime,
        //no idResource in new params means it's inserted by the logged user,
        // otherwise it's a staff operation and status is already set to confirmed
        status: newWorkstationParams.idResource == null? WORKSTATION_STATUS_PENDING:WORKSTATION_STATUS_CONFIRMED,
        idResource: newWorkstationParams.idResource ?? loggedUser?.idResource,
      );
      // performing remote insert
      return await _workstationRepository.insertWorkstation(newWorkstation);
  }
}
