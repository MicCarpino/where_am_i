import 'package:dartz/dartz.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/apk_version.dart';

abstract class ApkVersionRepository{
  Future<Either<Failure, ApkVersion>> getLastApkVersion();
}