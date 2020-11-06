import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/apk_version_model.dart';
import 'package:where_am_i/data/models/authenticated_user_model.dart';
import 'package:where_am_i/data/models/reservation_model.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/data/models/workstation_model.dart';
import 'package:where_am_i/domain/entities/user.dart';

abstract class RemoteDataSource {
  //USER
  Future<AuthenticatedUserModel> performUserAuthentication(
      String username, String password);

  Future<List<UserModel>> getUsers(String token);

  Future<UserModel> updateUser(String token, UserModel userUpdated);

  //WORKSTATIONS
  Future<List<WorkstationModel>> getAllWorkstationsByDate(
      String token, DateTime date);

  Future<List<WorkstationModel>> getAllWorkstationsByIdResource(
      String token, String idResource);

  Future<WorkstationModel> insertWorkstation(
      String token, WorkstationModel workstation);

  Future<WorkstationModel> updateWorkstation(
      String token, WorkstationModel updatedWorkstation);

  Future<void> deleteWorkstation(String token, int idWorkstation);

  //RESERVATIONS
  Future<List<ReservationModel>> getAllReservationsByDate(
      String token, DateTime date);

  Future<ReservationModel> insertReservation(
      String authenticationToken, ReservationModel reservationModel);

  Future<ReservationModel> updateReservation(
      String authenticationToken, ReservationModel reservation);

  Future<void> deleteReservation(String authenticationToken, int idReservation);

  //APK VERSION
 Future<ApkVersionModel> getLastApkVersion(String authenticationToken);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final HttpClient client;

  RemoteDataSourceImpl({@required this.client});

  String formatDateToString(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  Exception failureResult(Response response ){
    if(response.statusCode == 401){
      return UnauthorizedException();
    }
    if(response.statusCode == 500) {
      throw ServerException(response.body);
    } else {
      throw UnexpectedException(response.body);
    }
  }
  @override
  Future<AuthenticatedUserModel> performUserAuthentication(
      String username, String password) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/login',
        {'username': username.trim(), 'password': password});
    final response = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode == 200) {
      return AuthenticatedUserModel.fromJson(json.decode(response.body));
    } else {
     throw failureResult(response);
    }
  }

  @override
  Future<List<WorkstationModel>> getAllWorkstationsByDate(
      String token, DateTime date) async {
    var uri = Uri.https(
        BASE_URL, '/WhereAmI/workstation/${formatDateToString(date)}');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<WorkstationModel>.from(
          workstationsList.map((e) => WorkstationModel.fromJson(e)));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<List<WorkstationModel>> getAllWorkstationsByIdResource(
      String token, String idResource) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/resource/$idResource');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<WorkstationModel>.from(
          workstationsList.map((e) => WorkstationModel.fromJson(e)));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<WorkstationModel> insertWorkstation(
      String token, WorkstationModel workstation) async {
    var uri = Uri.https(
      BASE_URL,
      '/WhereAmI/workstation',
      workstation.toQueryParams(),
    );
    final response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return WorkstationModel.fromJson(json.decode(response.body));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<WorkstationModel> updateWorkstation(
      String token, WorkstationModel updatedWorkstation) async {
    var uri = Uri.https(
      BASE_URL,
      '/WhereAmI/workstation',
      updatedWorkstation.toQueryParams(),
    );
    final response = await http.put(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return WorkstationModel.fromJson(jsonDecode(response.body));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<void> deleteWorkstation(String token, int idWorkstation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/$idWorkstation');
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return;
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<List<ReservationModel>> getAllReservationsByDate(
      String token, DateTime date) async {
    var uri = Uri.https(
        BASE_URL, '/WhereAmI/reservation/${formatDateToString(date)}');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      List<dynamic> reservationsList = json.decode(response.body);
      return List<ReservationModel>.from(
          reservationsList.map((e) => ReservationModel.fromJson(e)));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<List<UserModel>> getUsers(String token) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/user');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      var usersList = json.decode(response.body);
      return List<UserModel>.from(usersList.map((e) => UserModel.fromJson(e)));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<UserModel> updateUser(String token, User updatedUser) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/role/${updatedUser.idResource}',
        {'idRole': updatedUser.idRole.toString()});
    final response = await http.put(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<ReservationModel> insertReservation(
      String authenticationToken, ReservationModel reservationModel) async {
    var uri = Uri.https(
        BASE_URL, '/WhereAmI/reservation', reservationModel.toQueryParams());
    final response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(json.decode(response.body));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<ReservationModel> updateReservation(
      String authenticationToken, ReservationModel reservation) async {
    var uri = Uri.https(
      BASE_URL,
      '/WhereAmI/reservation/${reservation.idReservation}',
      reservation.toQueryParams(),
    );
    final response = await http.put(uri, headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(json.decode(response.body));
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<void> deleteReservation(
      String authenticationToken, int idReservation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/reservation/$idReservation');
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return;
    } else {
      throw failureResult(response);
    }
  }

  @override
  Future<ApkVersionModel> getLastApkVersion(String authenticationToken)  async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/apkVersion');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: authenticationToken,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      return ApkVersionModel.fromJson(json.decode(response.body));
    } else {
      throw failureResult(response);
    }
  }
}
