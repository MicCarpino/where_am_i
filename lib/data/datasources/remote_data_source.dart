import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/authenticated_user_model.dart';
import 'package:where_am_i/data/models/reservation_model.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/data/models/workstation_dto.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

abstract class RemoteDataSource {
  //USER
  Future<AuthenticatedUserModel> performUserAuthentication(
      String username, String password);

  Future<List<UserModel>> getUsers(String token);

  Future<UserModel> updateUser(String token, UserModel userUpdated);

  //WORKSTATIONS
  Future<List<Workstation>> getAllWorkstationsByDate(
      String token, DateTime date);

  Future<List<Workstation>> getAllWorkstationsByIdResource(
      String token, String idResource);

  Future<List<Workstation>> getAllWorkstationsByIdResourceToEndOfMonth(
      String token, String idResource, String date);

  Future<Workstation> insertWorkstation(
      String token, WorkstationDto workstation);

  Future<List<Workstation>> insertAllWorkstations(
      String authenticationToken, List<WorkstationDto> list);

  Future<Workstation> updateWorkstation(
      String token, WorkstationDto updatedWorkstation);

  Future<List<Workstation>> updateAllWorkstations(
      String token, List<WorkstationDto> list);

  Future<Workstation> updateWorkstationStatus(
      String token, WorkstationStatusParameters workstationStatusParameters);

  Future<void> deleteWorkstation(String token, int idWorkstation);

  //RESERVATIONS
  Future<List<ReservationModel>> getAllReservationsByDate(
      String token, DateTime date);

  Future<ReservationModel> insertReservation(
      String token, ReservationModel reservationModel);

  Future<ReservationModel> updateReservation(
      String token, ReservationModel reservation);

  Future<void> deleteReservation(String token, int idReservation);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  Function onRevoke;

  RemoteDataSourceImpl({@required this.onRevoke});

  String formatDateToString(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  _handleFailureResult(http.Response response) {
    if (response.statusCode == 401) {
      print('CALLING LOGOUT ON 401');
      onRevoke.call();
      throw UnauthorizedException();
    } else {
      throw ServerException(response.body);
    }
  }

  @override
  Future<AuthenticatedUserModel> performUserAuthentication(
      String username, String password) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/login',
        {'username': username.trim(), 'password': password});
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return AuthenticatedUserModel.fromJson(json.decode(response.body));
    } else {
       throw UnauthorizedException();
    }
  }

  @override
  Future<List<Workstation>> getAllWorkstationsByDate(
      String token, DateTime date) async {
    var uri = Uri.https(
        BASE_URL, '/WhereAmI/workstation/byDate/${formatDateToString(date)}');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<Workstation>.from(
          workstationsList.map((e) => WorkstationDto.fromJson(e).toDomain()));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<List<Workstation>> getAllWorkstationsByIdResource(
      String token, String idResource) async {
    var uri =
        Uri.https(BASE_URL, '/WhereAmI/workstation/byIdResource/$idResource');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<Workstation>.from(
          workstationsList.map((e) => WorkstationDto.fromJson(e).toDomain()));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<List<Workstation>> getAllWorkstationsByIdResourceToEndOfMonth(
      String token, String idResource, String date) async {
    var uri = Uri.https(BASE_URL,
        '/WhereAmI/workstation//byIdResourceToEndOfMonth/$idResource/$date');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<Workstation>.from(
          workstationsList.map((e) => WorkstationDto.fromJson(e).toDomain()));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<Workstation> insertWorkstation(
      String token, WorkstationDto workstation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation');
    final response = await http
        .post(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: json.encode(workstation.toJson()))
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return WorkstationDto.fromJson(json.decode(response.body)).toDomain();
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<List<Workstation>> insertAllWorkstations(
      String token, List<WorkstationDto> list) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/insertAll');
    var body = json.encode(
        list.map((workstationModel) => workstationModel.toJson()).toList());
    final response = await http
        .post(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<Workstation>.from(
          workstationsList.map((e) => WorkstationDto.fromJson(e).toDomain()));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<Workstation> updateWorkstation(
      String token, WorkstationDto updatedWorkstation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation');
    var body = json.encode(updatedWorkstation.toJson());
    final response = await http
        .put(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return WorkstationDto.fromJson(jsonDecode(response.body)).toDomain();
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<List<Workstation>> updateAllWorkstations(
      String token, List<WorkstationDto> list) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/updateAll');
    var body = json.encode(
        list.map((workstationModel) => workstationModel.toJson()).toList());
    final response = await http
        .put(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> workstationsList = json.decode(response.body);
      return List<Workstation>.from(
          workstationsList.map((e) => WorkstationDto.fromJson(e).toDomain()));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<Workstation> updateWorkstationStatus(String token,
      WorkstationStatusParameters workstationStatusParameters) async {
    var uri = Uri.https(BASE_URL,
        '/WhereAmI/workstation/${workstationStatusParameters.idWorkstation}/${workstationStatusParameters.status}');
    final response = await http.put(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return WorkstationDto.fromJson(jsonDecode(response.body)).toDomain();
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<void> deleteWorkstation(String token, int idWorkstation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/$idWorkstation');
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return;
    } else {
      return _handleFailureResult(response);
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
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      List<dynamic> reservationsList = json.decode(response.body);
      return List<ReservationModel>.from(
          reservationsList.map((e) => ReservationModel.fromJson(e)));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<List<UserModel>> getUsers(String token) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/user');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      var usersList = json.decode(response.body);
      return List<UserModel>.from(usersList.map((e) => UserModel.fromJson(e)));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<UserModel> updateUser(String token, User updatedUser) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/role/${updatedUser.idResource}',
        {'idRole': updatedUser.idRole.toString()});
    final response = await http.put(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<ReservationModel> insertReservation(
      String token, ReservationModel reservationModel) async {
    var body = json.encode(reservationModel.toJson());
    var uri = Uri.https(BASE_URL, '/WhereAmI/reservation');
    final response = await http
        .post(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(json.decode(response.body));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<ReservationModel> updateReservation(
      String token, ReservationModel reservationModel) async {
    var body = json.encode(reservationModel.toJson());
    var uri = Uri.https(
      BASE_URL,
      '/WhereAmI/reservation/${reservationModel.idReservation}',
    );
    final response = await http
        .put(uri,
            headers: {
              HttpHeaders.authorizationHeader: token,
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: body)
        .timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return ReservationModel.fromJson(json.decode(response.body));
    } else {
      return _handleFailureResult(response);
    }
  }

  @override
  Future<void> deleteReservation(String token, int idReservation) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/reservation/$idReservation');
    final response = await http.delete(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(HTTP_TIMEOUT);
    if (response.statusCode == 200) {
      return;
    } else {
      return _handleFailureResult(response);
    }
  }
}
