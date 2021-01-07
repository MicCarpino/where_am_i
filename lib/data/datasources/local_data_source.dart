import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/models/authenticated_user_model.dart';

abstract class LocalDataSource {
  Future<AuthenticatedUserModel> getCachedUser();

  Future<void> cacheLoggedUser(AuthenticatedUserModel userModel);

  Future<void> deleteLoggedUser();

  Future<void> storeCredentials(String username, String password);

  Future<void> removeStoredCredentials();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<AuthenticatedUserModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(CACHED_LOGGED_USER);
    return jsonString != null
        ? Future.value(AuthenticatedUserModel.fromJson(json.decode(jsonString)))
        : null;
  }

  @override
  Future<void> cacheLoggedUser(AuthenticatedUserModel loggedUser) {
    return sharedPreferences.setString(
        CACHED_LOGGED_USER, json.encode(loggedUser.toJson()));
  }

  @override
  Future<void> deleteLoggedUser() {
    return sharedPreferences.remove(CACHED_LOGGED_USER);
  }

  @override
  Future<void> storeCredentials(String username, String password) {
    return Future.wait([
      sharedPreferences.setBool(IS_REMEMBER_ME_CHECKED, true),
      sharedPreferences.setString(STORED_USERNAME, username),
      sharedPreferences.setString(STORED_PASSWORD, password),
    ]);
  }

  @override
  Future<void> removeStoredCredentials() {
    return Future.wait([
      sharedPreferences.remove(IS_REMEMBER_ME_CHECKED),
      sharedPreferences.remove(STORED_USERNAME),
      sharedPreferences.remove(STORED_PASSWORD),
    ]);
  }
}
