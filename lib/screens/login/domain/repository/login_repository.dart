import 'package:clean_folder_str/models/auth_data_model.dart';

abstract class LoginRepository {
  Future<AuthDataModel> login({
    required String email,
    required String password,
  });
}
