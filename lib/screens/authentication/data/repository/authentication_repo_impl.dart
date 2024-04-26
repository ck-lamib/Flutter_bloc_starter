import 'package:clean_folder_str/datasource/local/localuserauthservice/local_user_auth_service.dart';
import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';
import 'package:clean_folder_str/screens/authentication/domain/repository/authentication_repo.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required LocalUserAuthService localUserAuthService,
  }) : _localUserAuthService = localUserAuthService;

  final LocalUserAuthService _localUserAuthService;
//user
  @override
  User getUser() {
    return _localUserAuthService.getUser();
  }

  @override
  Future<bool> saveUser({required User user}) {
    return _localUserAuthService.saveUser(user: user);
  }

  @override
  Future<bool> updateUser({required User user}) {
    return _localUserAuthService.updateUser(user: user);
  }

  @override
  Future<bool> deleteUser() {
    return _localUserAuthService.deleteUser();
  }

//token
  @override
  Token getToken() {
    return _localUserAuthService.getToken();
  }

  @override
  Future<bool> saveToken({required Token token}) {
    return _localUserAuthService.saveToken(token: token);
  }

  @override
  Future<bool> updateToken({required Token token}) {
    return _localUserAuthService.updateToken(token: token);
  }

  @override
  Future<bool> deleteToken() {
    return _localUserAuthService.deleteToken();
  }
}
