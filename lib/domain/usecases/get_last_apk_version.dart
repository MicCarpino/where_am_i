import 'package:dartz/dartz.dart';
import 'package:where_am_i/domain/entities/apk_version.dart';
import 'package:where_am_i/domain/repositories/apk_version_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';

class GetLastApkVersion implements UseCase<ApkVersion, NoParams> {
  final ApkVersionRepository _apkVersionRepository;
  GetLastApkVersion(this._apkVersionRepository);

  @override
  Future<Either<Failure, ApkVersion>> call(NoParams params) async{
    return await _apkVersionRepository.getLastApkVersion();
  }
}