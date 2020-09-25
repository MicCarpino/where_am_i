import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences _preferences;
  static const String UserKey = 'user';
  static const String userEmail = 'user_email';
  static const String userPass = 'user_pass';

  static Future<SharedPreferences> getPreferences() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _preferences;
  }

  static void setUserCreds(String email, String pass) async {
    final sp = await getPreferences();
    sp.setString(userEmail, email);
    sp.setString(userPass, pass);
  }

  static Future<dynamic> getuserEmail() async {
    final sp = await getPreferences();
    return await sp.getString(userEmail);
  }

  static Future<dynamic> getuserPass() async {
    final sp = await getPreferences();
    return await sp.getString(userPass);
  }

  static void clearPrefs() async {
    final sp = await getPreferences();
    sp.clear();
  }
}
