import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApkVersion extends Equatable {
  final int idApk;
  final String apkVersion;
  final String apkDownloadUrl;
  final DateTime apkInsertDate;

  ApkVersion({
    @required this.idApk,
    @required this.apkVersion,
    @required this.apkDownloadUrl,
    @required this.apkInsertDate,
  });


  @override
  List<Object> get props => [idApk, apkVersion, apkDownloadUrl,apkInsertDate];
}
