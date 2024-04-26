import 'package:clean_folder_str/app/failure.dart';
import 'package:clean_folder_str/datasource/local/localuserauthservice/local_user_auth_service.dart';
import 'package:clean_folder_str/models/auth_data_model.dart';
import 'package:clean_folder_str/screens/login/domain/repository/login_repository.dart';
import 'package:clean_folder_str/utils/helpers/logger.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final LocalUserAuthService _localUserService;
  final LoginRepository _loginRepository;

  LoginUseCase({
    required LocalUserAuthService localUserService,
    required LoginRepository loginRepository,
  })  : _localUserService = localUserService,
        _loginRepository = loginRepository;

  Future<Either<Failure, AuthDataModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      AuthDataModel authDataModel = await _loginRepository.login(
        email: email,
        password: password,
      );
      var isUserSavedToLocalStorage = await _localUserService.saveUser(
        user: authDataModel.user!,
      );
      var isTokenSavedToLocalStorage = await _localUserService.saveToken(
        token: authDataModel.token!,
      );

      if (isUserSavedToLocalStorage && isTokenSavedToLocalStorage) {
        return Right(authDataModel);
      } else {
        return const Left(
          Exception("Something went wrong while saving user to local storage."),
        );
      }
    } catch (e) {
      CustomLogger.trace(e);
      if (e is Failure) {
        return Left(e);
      }
      return const Left(Exception("Error while fetching login details."));
    }
  }
}
