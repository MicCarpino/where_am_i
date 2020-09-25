import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:where_am_i/core/error/exceptions.dart';

import 'package:where_am_i/data/models/user_model.dart';

const BASE_URL = "wai.dncsrl.com";
String encryptedPw =
    "=";

abstract class RemoteDataSource {
  Future<UserModel> performUserAuthentication(String username, String password);
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
    final response =
        await http.post(uri, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(response.body);
    }
  }
}
