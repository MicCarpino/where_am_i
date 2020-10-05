import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/exceptions.dart';

import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class WorkstationRepositoryImpl implements WorkstationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  static var cachedWorkstationsList = List<Workstation>();
  static var cachedUserPresences = List<Workstation>();

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
          loggedUser.authenticationToken, loggedUser.user.idResource);
      cachedUserPresences = userPresences;
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
      cachedUserPresences.map((e) => e.workstationDate).toList();
      //date has been removed
      DateTime dateRemoved = oldUserPresences
          .toSet()
          .difference(newUserPresences.toSet())
          .toList()
          .first;
      if (dateRemoved != null) {
        var idWorkstation = cachedUserPresences
            .firstWhere((element) => element.workstationDate == dateRemoved)
            .idWorkstation;
       /* await remoteDataSource.deleteWorkstation(
            currentUser.authenticationToken, idWorkstation);
        cachedUserPresences.removeWhere((element) =>
        element.workstationDate == dateRemoved);*/
      }
      //date has been added
      DateTime dateAdded = newUserPresences
          .toSet()
          .difference(oldUserPresences.toSet())
          .toList()
          .first;
      if (dateAdded != null) {
        /*var addPresenceResult = await remoteDataSource.insertWorkstation(
            currentUser.authenticationToken,
            WorkstationModel(
                idResource: currentUser.user.idResource,
                idWorkstation: null,
                freeName: null,
                codeWorkstation: null,
                workstationDate: dateAdded));
        cachedUserPresences.add(addPresenceResult);*/
      }
      return Right(cachedUserPresences);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWorkstation(int idWorkstation) {
    throw UnimplementedError();
  }
}
