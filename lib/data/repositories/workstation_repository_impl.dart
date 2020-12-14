import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
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

  List<Workstation> getCachedPresences() => cachedUserPresences;

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
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> getAllWorkstationsByIdResource(
      int idResource) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final userPresences =
          await remoteDataSource.getAllWorkstationsByIdResource(
              loggedUser.authenticationToken, idResource.toString());
      cachedUserPresences = userPresences;
      return Right(userPresences);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>>
      getAllWorkstationsByIdResourceToEndOfMonth(
          String idResource, String date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final userPresencesToEndOfMonth =
          await remoteDataSource.getAllWorkstationsByIdResourceToEndOfMonth(
              loggedUser.authenticationToken, idResource, date);
      return Right(userPresencesToEndOfMonth);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workstation>> insertWorkstation(
      Workstation workstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertWorkstation(
          loggedUser.authenticationToken, workstation.toWorkstationModel());
      return Right(insertResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> insertAllWorkstations(List<Workstation> newWorkstations) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertAllWorkstations(
          loggedUser.authenticationToken, newWorkstations.map((e) => e.toWorkstationModel()).toList());
      return Right(insertResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
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
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> updateAllWorkstations(
      List<Workstation> updatedWorkstations) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateAllWorkstations(
          loggedUser.authenticationToken,
          updatedWorkstations.map((e) => e.toWorkstationModel()).toList());
      return Right(updateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workstation>> updateWorkstationStatus(
      WorkstationStatusParameters workstationStatusParameters) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final statusUpdateResult = await remoteDataSource.updateWorkstationStatus(
          loggedUser.authenticationToken, workstationStatusParameters);
      return Right(statusUpdateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteWorkstation(int idWorkstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      await remoteDataSource.deleteWorkstation(
          loggedUser.authenticationToken, idWorkstation);
      return Right(idWorkstation);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
