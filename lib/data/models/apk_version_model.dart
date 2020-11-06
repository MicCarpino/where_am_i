import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/apk_version.dart';

class ApkVersionModel extends ApkVersion {
  ApkVersionModel({
    @required int idApk,
    @required String apkVersion,
    @required String apkDownloadUrl,
    @required DateTime apkInsertDate,
  }) : super(
          idApk: idApk,
          apkVersion: apkVersion,
          apkDownloadUrl: apkDownloadUrl,
          apkInsertDate: apkInsertDate,
        );

  factory ApkVersionModel.fromJson(Map<String, dynamic> json) {
    return ApkVersionModel(
      idApk: json["idApk"],
      apkVersion: json["apkVersion"],
      apkDownloadUrl: json["apkDownloadUrl"],
      apkInsertDate: (DateTime.parse(json["apkInsertDate"])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idApk': idApk,
      'apkVersion': apkVersion,
      'apkDownloadUrl': apkDownloadUrl,
      'apkInsertDate': DateFormat('yyyy-MM-dd').format(apkInsertDate)
    };
  }
}
