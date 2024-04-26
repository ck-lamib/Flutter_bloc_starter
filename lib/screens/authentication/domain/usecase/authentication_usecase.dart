import 'package:clean_folder_str/app/failure.dart';
import 'package:clean_folder_str/models/auth_data_model.dart';
import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';
import 'package:clean_folder_str/screens/authentication/domain/repository/authentication_repo.dart';
import 'package:dartz/dartz.dart';

class AuthenticationUseCase {
  AuthenticationUseCase(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

//credential
  Future<Either<Failure, AuthDataModel>> getAuthCredentialData() async {
    try {
      User user = _authenticationRepository.getUser();
      Token token = _authenticationRepository.getToken();

      AuthDataModel authDataModel = AuthDataModel(
        token: token,
        user: user,
      );
      return Right(authDataModel);
    } catch (e) {
      return Left(Exception(
        e.toString(),
      ));
    }
  }

  Future<Either<Failure, bool>> deleteAuthCredentialData() async {
    try {
      bool userDeleted = await _authenticationRepository.deleteUser();
      bool tokenDeleted = await _authenticationRepository.deleteToken();

      return Right(userDeleted && tokenDeleted);
    } catch (e) {
      return Left(Exception(
        e.toString(),
      ));
    }
  }
}
