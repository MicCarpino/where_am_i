// utils/shared_prefs.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/core/utils/constants.dart';

class SharedPrefs {
  static SharedPreferences _sharedPreferences;

  init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  String get jwtToken => _sharedPreferences.getString(JWT_TOKEN_KEY) ?? null;

  set jwtToken(String value) =>
      _sharedPreferences.setString(JWT_TOKEN_KEY, value);

  Future removeJwtToken() => _sharedPreferences.remove(JWT_TOKEN_KEY);
}

final sharedPreferences = SharedPrefs();
