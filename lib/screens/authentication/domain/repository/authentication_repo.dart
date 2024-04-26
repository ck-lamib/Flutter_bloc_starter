import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';

abstract class AuthenticationRepository {
  User getUser();
  Future<bool> saveUser({required User user});
  Future<bool> updateUser({required User user});
  Future<bool> deleteUser();

  Token getToken();
  Future<bool> saveToken({required Token token});
  Future<bool> updateToken({required Token token});
  Future<bool> deleteToken();
}
