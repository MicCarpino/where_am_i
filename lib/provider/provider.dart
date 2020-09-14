import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:where_am_i/models/logged_user.dart';
import 'package:where_am_i/utilities/constants.dart';

//TODO: fix the AES encryption and replace hardcoded password
String encryptedPw ="";

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
