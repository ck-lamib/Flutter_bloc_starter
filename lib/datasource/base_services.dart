import 'package:clean_folder_str/app/app.dart';
import 'package:clean_folder_str/datasource/local/localuserauthservice/local_user_auth_service.dart';
import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/screens/login/views/login_screen.dart';
import 'package:clean_folder_str/utils/helpers/logger.dart';
import 'package:clean_folder_str/utils/helpers/snackbar.dart';
import 'package:clean_folder_str/utils/routes/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseRemoteServices {
  final LocalUserAuthService localUserAuthService;

  Dio dio = Dio();
  CancelToken cancelToken = CancelToken();
  String tokenType = "Bearer";

  BaseRemoteServices({
    required this.localUserAuthService,
  }) {
    dio.options.sendTimeout = const Duration(seconds: 30);
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(LogInterceptor(responseBody: false, error: true));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.cancelToken = cancelToken;
          options.headers["Accept"] = '*/*';
          return handler.next(options);
        },
        onResponse: (e, handler) async {
          return handler.next(e);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 &&
              error.requestOptions.extra['requiresAuth'] == true) {
            return await handleTokenRefreshError(error, handler);
          }
          return handler.next(error);
        },
      ),
    );
  }

  String getAccessKey() {
    Token? token;
    try {
      token = localUserAuthService.getToken();
    } catch (e) {
      token = null;
    }
    return "$tokenType ${token?.access}";
  }

  String? getRefreshKey() {
    Token? token;
    try {
      token = localUserAuthService.getToken();
    } catch (e) {
      token = null;
    }
    return token?.refresh;
  }

  updateTokenKey(String accessKey) async {
    Token? oldToken;
    try {
      CustomLogger.trace("it is inside update token.");
      oldToken = localUserAuthService.getToken();
    } catch (e) {
      oldToken = null;
    }
    if (oldToken != null) {
      oldToken.copyWith(
        access: accessKey,
      );
    }
    if (oldToken != null) {
      await localUserAuthService.updateToken(token: oldToken);
    }
  }

  Future<void> handleTokenRefreshError(
      DioException error, ErrorInterceptorHandler handler) async {
    try {
      final newToken = await _refreshToken();
      if (newToken != null) {
        await updateTokenKey(newToken);
        // Retry original request with new token
        final retryRequestOptions = error.requestOptions.copyWith(
          headers: {
            ...error.requestOptions.headers,
            'Authorization': "$tokenType $newToken",
          },
        );

        return handler.resolve(
          await dio.fetch(retryRequestOptions),
        );
      }
    } catch (_) {
      CustomLogger.trace(_);
      // Handle token refresh failure
    }
    // Handle token refresh failure or expired session
    await handleLogout();
  }

  Future<String?> _refreshToken() async {
    try {
      final data = FormData.fromMap({"refresh": getRefreshKey()});
      final response = await Dio().post(
        Apis.refreshTokenUrl,
        data: data,
        options: Options(
          validateStatus: (status) => true,
          receiveDataWhenStatusError: true,
        ),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map && responseData.containsKey("access")) {
          return responseData['access'];
        }
      }
    } catch (e) {
      // Handle token refresh failure
    }
    return null;
  }

  Future<void> handleLogout() async {
    await localUserAuthService.deleteToken();
    await localUserAuthService.deleteUser();
    Navigator.of(navigatorKey.currentContext!)
        .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
    CustomSnackBar.error(
      context: navigatorKey.currentContext!,
      title: "Login required",
      message: "Your session time is expired so login is required.",
      duration: 3,
    );
    return;
  }

  // Methods for making HTTP requests
  Future<Response> _sendRequest({
    required String method,
    required String url,
    dynamic data,
    bool requiresAuth = false,
  }) async {
    final requestOptions = Options(
      extra: {'requiresAuth': requiresAuth},
    );

    // Check if authentication is required for this request
    if (requiresAuth) {
      final token = getAccessKey();
      if (token.trim() != tokenType) {
        requestOptions.headers = {'Authorization': token, "Accept": '*/*'};
      } else {
        CustomLogger.trace("auth token is empty when required");
      }
    }

    try {
      switch (method) {
        case 'GET':
          return await dio.get(url, options: requestOptions);
        case 'POST':
          return await dio.post(url, data: data, options: requestOptions);
        case 'PUT':
          return await dio.put(url, data: data, options: requestOptions);
        case 'PATCH':
          return await dio.patch(url, data: data, options: requestOptions);
        case 'DELETE':
          return await dio.delete(url, options: requestOptions);
        default:
          throw Exception('Invalid HTTP method: $method');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get({
    required String url,
    bool requiresAuth = false,
  }) async {
    return _sendRequest(method: 'GET', url: url, requiresAuth: requiresAuth);
  }

  Future<Response> post({
    required String url,
    dynamic data,
    bool requiresAuth = false,
  }) async {
    return _sendRequest(
        method: 'POST', url: url, data: data, requiresAuth: requiresAuth);
  }

  Future<Response> put({
    required String url,
    dynamic data,
    bool requiresAuth = false,
  }) async {
    return _sendRequest(
        method: 'PUT', url: url, data: data, requiresAuth: requiresAuth);
  }

  Future<Response> patch({
    required String url,
    dynamic data,
    bool requiresAuth = false,
  }) async {
    return _sendRequest(
        method: 'PATCH', url: url, data: data, requiresAuth: requiresAuth);
  }

  Future<Response> delete({
    required String url,
    bool requiresAuth = false,
  }) async {
    return _sendRequest(method: 'DELETE', url: url, requiresAuth: requiresAuth);
  }
}
