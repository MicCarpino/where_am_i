import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class RemoveUserPresence
    extends UseCase<List<Workstation>, int> {
  final WorkstationRepository _workstationRepository;
  final AuthRepository _authRepository;

  RemoveUserPresence(this._workstationRepository, this._authRepository);

  Future<Either<Failure, List<Workstation>>> call(
     int idWorkstation) async {
    var currentUser = await _authRepository.getLoggedUser();
    User loggedUser = currentUser.getOrElse(() => null)?.user;
    if (loggedUser != null) {
      var removeResult = await _workstationRepository.deleteWorkstation(idWorkstation);
    }
  }
}
