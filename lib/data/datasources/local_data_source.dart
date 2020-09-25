import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/core/error/exceptions.dart';
import 'package:where_am_i/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<UserModel> getCachedUser();

  Future<void> cacheLoggedUser(UserModel userModel);

  Future<void> deleteLoggedUser();
}

const CACHED_LOGGED_USER = 'CACHED_LOGGED_USER';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<UserModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(CACHED_LOGGED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLoggedUser(UserModel loggedUser) {
    return sharedPreferences.setString(
        CACHED_LOGGED_USER, json.encode(loggedUser.toJson()));
  }

  @override
  Future<void> deleteLoggedUser() {
    return sharedPreferences.remove(CACHED_LOGGED_USER);
  }
}
