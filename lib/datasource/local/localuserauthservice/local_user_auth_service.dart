import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalUserAuthService {
  User getUser();
  Future<bool> saveUser({required User user});
  Future<bool> updateUser({required User user});
  Future<bool> deleteUser();

  Token getToken();
  Future<bool> saveToken({required Token token});
  Future<bool> updateToken({required Token token});
  Future<bool> deleteToken();
}

class LocalUserAuthServiceImpl extends LocalUserAuthService {
  LocalUserAuthServiceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;
  final String localUserKey = "userKey";
  final String localtokenKey = "tokenKey";

//for user
  @override
  User getUser() {
    try {
      User user;
      var userData = _sharedPreferences.getString(localUserKey);
      if (userData != null) {
        user = User.fromRawJson(userData);
        return user;
      } else {
        throw Exception("User not available.");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveUser({required User user}) async {
    try {
      bool result = await _sharedPreferences.setString(
        localUserKey,
        user.toRawJson(),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateUser({required User user}) async {
    try {
      bool result = await _sharedPreferences.setString(
        localUserKey,
        user.toRawJson(),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      bool result = await _sharedPreferences.remove(
        localUserKey,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

//for token
  @override
  Token getToken() {
    try {
      Token token;
      var tokenData = _sharedPreferences.getString(localtokenKey);
      if (tokenData != null) {
        token = Token.fromRawJson(tokenData);
        return token;
      } else {
        throw Exception("Token not available.");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveToken({required Token token}) async {
    try {
      bool result = await _sharedPreferences.setString(
        localtokenKey,
        token.toRawJson(),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateToken({required Token token}) async {
    try {
      bool result = await _sharedPreferences.setString(
        localtokenKey,
        token.toRawJson(),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteToken() async {
    try {
      bool result = await _sharedPreferences.remove(
        localtokenKey,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
