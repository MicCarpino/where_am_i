import 'package:dartz/dartz.dart';
import 'package:diffutil_dart/diffutil.dart' as diffutil;
import 'package:where_am_i/data/models/workstation_model.dart';

import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class InsertUserPresence
    extends UseCase<List<Workstation>,NewPresenceParams> {
  final WorkstationRepository _workstationRepository;
  final AuthRepository _authRepository;

  InsertUserPresence(this._workstationRepository, this._authRepository);

  Future<Either<Failure, List<Workstation>>> call(
      NewPresenceParams newWorkstationParams) async {
    var currentUser = await _authRepository.getLoggedUser();
    User loggedUser = currentUser.getOrElse(() => null)?.user;
    if (loggedUser != null) {
      var newWorkstation = Workstation(
        idWorkstation: null,
        workstationDate: newWorkstationParams.date,
        codeWorkstation: null,
        startTime: newWorkstationParams.startTime,
        endTime: newWorkstationParams.endTime,
        idResource: loggedUser.idResource,
      );
      var insertResult = await _workstationRepository.insertWorkstation(newWorkstation);
      if(insertResult.isRight()) {
        return Right(addAndReturn(insertResult));
      }
    }
    return Left(CacheFailure());
  }

  List<Workstation> addAndReturn(WorkstationModel insertedWorkstation){
    List<Workstation> userPresences = _workstationRepository.getCachedUserPresences();
    if (userPresences.isEmpty){

    }
      userPresences.add(insertedWorkstation);
      return userPresences;

  }



  @override
  Future<Either<Failure, List<Workstation>>> updateUserWorkstations(
      List<DateTime> newUserPresences) async {
    try {
      var currentUser = await localDataSource.getCachedUser();
      var oldUserPresences =
      cachedCurrentUserPresences.map((e) => e.workstationDate).toList();
      var listDiff = diffutil
          .calculateListDiff(oldUserPresences, newUserPresences,
          detectMoves: false)
          .getUpdates();
      for (final update in listDiff) {
        update.when(
          insert: (pos, count) async {
            var dateToAdd = newUserPresences[pos];
            var newWorkstation = WorkstationModel(
                idResource: currentUser.user.idResource,
                idWorkstation: null,
                freeName: null,
                codeWorkstation: null,
                workstationDate: dateToAdd);
            var insertResult = await remoteDataSource.insertWorkstation(
                currentUser.authenticationToken, newWorkstation);
            cachedCurrentUserPresences.add(insertResult);
            print("DATE ADDED $dateToAdd");
          },
          remove: (pos, count) async {
            var dateToRemove = oldUserPresences[pos];
            var idWorkstation = cachedCurrentUserPresences
                .firstWhere(
                    (element) => element.workstationDate == dateToRemove)
                .idWorkstation;
            await remoteDataSource.deleteWorkstation(
                currentUser.authenticationToken, idWorkstation);
            cachedCurrentUserPresences.removeWhere(
                    (element) => element.idWorkstation == idWorkstation);
            print("DATE REMOVED $dateToRemove");
          },
        );
      }
      return Right(cachedCurrentUserPresences);
    } on ServerException catch (error) {
      print("PRESENCES UPDATE SERVER ERROR " + error.errorMessage);
      return Left(ServerFailure(error.errorMessage));
    } catch (e) {
      print("PRESENCES UPDATE UNEXP ERROR " + e.toString());
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
