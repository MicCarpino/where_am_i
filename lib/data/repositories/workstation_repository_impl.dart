import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/models/workstation_dto.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

class WorkstationRepositoryImpl implements WorkstationRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  static var cachedWorkstationsList = List<Workstation>.empty();

  WorkstationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Workstation>>> getAllByDate(DateTime date) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final workstationsList = await remoteDataSource.getAllWorkstationsByDate(
          loggedUser.authenticationToken, date);
      return Right(workstationsList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> getAllForCurrentUser() async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final userPresences =
          await remoteDataSource.getAllWorkstationsByIdResource(
        loggedUser.authenticationToken,
        loggedUser.user.idResource,
      );
      return Right(userPresences);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> getAllByIdResourceToEndOfMonth(
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
  Future<Either<Failure, Workstation>> insert(Workstation workstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertWorkstation(
        loggedUser.authenticationToken,
        WorkstationDto.fromDomain(workstation),
      );
      return Right(insertResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> insertAll(
      List<Workstation> newWorkstations) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final insertResult = await remoteDataSource.insertAllWorkstations(
          loggedUser.authenticationToken,
          newWorkstations.map((e) => WorkstationDto.fromDomain(e)).toList());
      return Right(insertResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workstation>> update(
      Workstation updatedWorkstation) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateWorkstation(
        loggedUser.authenticationToken,
        WorkstationDto.fromDomain(updatedWorkstation),
      );
      return Right(updateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workstation>>> updateAll(
      List<Workstation> updatedWorkstations) async {
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final updateResult = await remoteDataSource.updateAllWorkstations(
          loggedUser.authenticationToken,
          updatedWorkstations
              .map((e) => WorkstationDto.fromDomain(e))
              .toList());
      return Right(updateResult);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workstation>> updateStatus(
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
  Future<Either<Failure, int>> delete(int idWorkstation) async {
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
