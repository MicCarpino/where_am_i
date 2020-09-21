import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/features/data/model/logged_user.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/core/utils/constants.dart';

//TODO: fix the AES encryption and replace hardcoded password
String encryptedPw ="YmQ2YzdlNDc0N2EyOTYyZTM4Y2ZkY2RmNTg2Y2Q3Yjk6Ojk2N2M5NmYzNDRmODhlM2NjYWE1MTJiNmFlNGQ0MjQ3OjpjWkZrT25lUEtoOHlSSndhMm0zbFNRPT0=";

Future<LoggedUser> performLogin(String username, String password) async {
  var uri = Uri.https(BASE_URL, '/WhereAmI/login', {'username': username, 'password': encryptedPw});
  final response = await http.post(uri);
  print(response.body.toString());
  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
  final data = json.decode(response.body);
  return LoggedUser.fromData(data);
}
