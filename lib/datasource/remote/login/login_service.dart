import 'package:clean_folder_str/datasource/base_services.dart';
import 'package:clean_folder_str/utils/helpers/logger.dart';
import 'package:clean_folder_str/utils/routes/api_routes.dart';
import 'package:dio/dio.dart';

abstract class LoginService {
  Future<Response> login({
    required String email,
    required String password,
  });
  Future<void> logOut();
}

class LoginServiceImpl extends LoginService {
  final BaseRemoteServices _baseRemoteServices;
  LoginServiceImpl({required BaseRemoteServices baseRemoteServices})
      : _baseRemoteServices = baseRemoteServices;

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      return _baseRemoteServices.post(url: Apis.loginUrl, data: {
        "email": email,
        "password": password,
      });
    } catch (e) {
      CustomLogger.trace(e);
      rethrow;
    }
  }
}
