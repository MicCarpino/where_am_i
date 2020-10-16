import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
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

  //TODO: enable insert/delete calls when switching to test server
  @override
  Future<Either<Failure, List<Workstation>>> updateUserWorkstations(
      List<DateTime> newUserPresences) async {
    try {
      var currentUser = await localDataSource.getCachedUser();
      var oldUserPresences =
          cachedCurrentUserPresences.map((e) => e.workstationDate).toList();
      //date has been removed
      DateTime dateRemoved = oldUserPresences
          .toSet()
          .difference(newUserPresences.toSet())
          .toList()
          .first;
      if (dateRemoved != null) {
        var idWorkstation = cachedCurrentUserPresences
            .firstWhere((element) => element.workstationDate == dateRemoved)
            .idWorkstation;
        await remoteDataSource.deleteWorkstation(
            currentUser.authenticationToken, idWorkstation);
        cachedCurrentUserPresences
            .removeWhere((element) => element.workstationDate == dateRemoved);
      }
      //date has been added
      DateTime dateAdded = newUserPresences
          .toSet()
          .difference(oldUserPresences.toSet())
          .toList()
          .first;
      if (dateAdded != null) {
        var addPresenceResult = await remoteDataSource.insertWorkstation(
            currentUser.authenticationToken,
            WorkstationModel(
                idResource: currentUser.user.idResource,
                idWorkstation: null,
                freeName: null,
                codeWorkstation: null,
                workstationDate: dateAdded));
        cachedCurrentUserPresences.add(addPresenceResult);
      }
      return Right(cachedCurrentUserPresences);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> insertWorkstation(
      Workstation workstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertWorkstation(
          loggedUser.authenticationToken, workstation);
      cachedWorkstationsList.add(insertResult);
      return Right(cachedWorkstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> deleteWorkstation(
      int idWorkstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final deleteResult = await remoteDataSource.deleteWorkstation(
          loggedUser.authenticationToken, idWorkstation);
      cachedCurrentUserPresences.removeWhere(
          (workstation) => workstation.idWorkstation == idWorkstation);
      return Right(cachedWorkstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }
}
