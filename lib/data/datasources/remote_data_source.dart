import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/data/models/reservation_model.dart';

import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/data/models/workstation_model.dart';

const BASE_URL = "wai.dncsrl.com";
String encryptedPw = "=";

abstract class RemoteDataSource {
  Future<UserModel> performUserAuthentication(String username, String password);

  Future<List<WorkstationModel>> getWorkstations(String token, DateTime date);

  Future<List<ReservationModel>> getReservations(String token, DateTime date);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> performUserAuthentication(
      String username, String password) async {
    //TODO: replace with password encription
    var uri = Uri.https(BASE_URL, '/WhereAmI/login',
        {'username': username.trim(), 'password': encryptedPw});
    final response = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.body);
    }
  }

  @override
  Future<List<WorkstationModel>> getWorkstations(
      String token, DateTime date) async {
    var uri = Uri.https(BASE_URL, '/WhereAmI/workstation/$date');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      Iterable workstationsList = json.decode(response.body);
      return List<WorkstationModel>.from(workstationsList);
    } else {
      throw ServerException(response.body);
    }
  }

  @override
  Future<List<ReservationModel>> getReservations(
      String token, DateTime date) async {
    var uri = Uri.https(BASE_URL, '/reservation/$date');
    final response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      Iterable reservationsList = json.decode(response.body);
      return List<ReservationModel>.from(reservationsList);
    } else {
      throw ServerException(response.body);
    }
  }
}
