import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:diffutil_dart/diffutil.dart' as diffutil;

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class WorkstationRepositoryImpl implements WorkstationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  static var cachedWorkstationsList = List<Workstation>();
  static var cachedCurrentUserPresences = List<Workstation>();

  WorkstationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByDate(
      DateTime date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final workstationsList = await remoteDataSource.getAllWorkstationsByDate(
          loggedUser.authenticationToken, date);
      cachedWorkstationsList = workstationsList;
      return Right(workstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>>
      getAllWorkstationsByIdResource() async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final userPresences =
          await remoteDataSource.getAllWorkstationsByIdResource(
              loggedUser.authenticationToken,
              loggedUser.user.idResource.toString());
      cachedCurrentUserPresences = userPresences;
      return Right(userPresences);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
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

  @override
  Future<Either<Failure, List<Workstation>>> insertWorkstation(
      Workstation workstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertWorkstation(
          loggedUser.authenticationToken, workstation.toWorkstationModel());
      cachedWorkstationsList.add(insertResult);
      return Right(cachedWorkstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Workstation>> updateWorkstation(
      Workstation updatedWorkstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateWorkstation(
          loggedUser.authenticationToken,
          updatedWorkstation.toWorkstationModel());
      return Right(updateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> deleteWorkstation(
      int idWorkstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      await remoteDataSource.deleteWorkstation(
          loggedUser.authenticationToken, idWorkstation);
      cachedWorkstationsList.removeWhere(
          (workstation) => workstation.idWorkstation == idWorkstation);
      return Right(cachedWorkstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }
}
