import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/exceptions.dart';

import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/domain/entities/apk_version.dart';
import 'package:where_am_i/domain/repositories/apk_version_repository.dart';

class ApkVersionRepositoryImpl implements ApkVersionRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ApkVersionRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, ApkVersion>> getLastApkVersion() async {
    // TODO: implement getLastApkVersion
    try {
      var loggedUser = await localDataSource.getCachedUser();
      final lastApkVersion = await remoteDataSource
          .getLastApkVersion(loggedUser.authenticationToken);
      return Right(lastApkVersion);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorMessage));
    }
  }
}
