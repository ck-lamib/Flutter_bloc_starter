import 'package:clean_folder_str/app/failure.dart';
import 'package:clean_folder_str/datasource/remote/login/login_service.dart';
import 'package:clean_folder_str/models/auth_data_model.dart';
import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';
import 'package:clean_folder_str/screens/login/domain/repository/login_repository.dart';
import 'package:clean_folder_str/utils/helpers/logger.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl({required LoginService loginService})
      : _loginService = loginService;
  final LoginService _loginService;

  @override
  Future<AuthDataModel> login({
    required String email,
    required String password,
  }) async {
    // try {
    //   var response = await _loginService.login(
    //     email: email,
    //     password: password,
    //   );
    //   CustomLogger.trace(response);

    //   if (response.statusCode! >= 200 && response.statusCode! < 300) {
    //     return AuthDataModel.fromJson(response.data);
    //   } else {
    //     throw ApiFailure(
    //       "Bad status code",
    //       error: ApiError(
    //         fieldErrors: response.data["error"],
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   CustomLogger.trace(e);
    //   if (e is DioException) {
    //     if (e.response?.data != null &&
    //         e.response!.data is Map<String, dynamic>) {
    //       throw ApiFailure(
    //         "API request failure",
    //         error: ApiError(
    //           fieldErrors: e.response!.data,
    //         ),
    //       );
    //     } else {}
    //   }
    // }

    return await Future.delayed(const Duration(seconds: 3), () {
      return AuthDataModel(
        token: Token(
          access: "Thisisaccesstoken",
          refresh: "Thisisrefreshtoken",
        ),
        user: User(
          uuid: "1",
          fullname: "Bimal khatri",
          phoneNumber: "9867******",
          email: email,
          dob: "2002-07-07",
          gender: "Male",
          maritalStatus: "UnMarried",
          bloodGroup: "A+ve",
          nationality: "Nepali",
          address: "Pokhara",
          identificationNo: "09-09",
          fieldOfStudy: "Bachelor of science in computing with honours",
          institute: "ICP",
          emergencyContact: "9847******",
          emergencyPhone: "9847******",
          avatar: "",
        ),
      );
    });

    throw const Exception("Error while fetching login details.");
  }
}







      // return Future.delayed(
      //   Duration(
      //     seconds: requestDelay,
      //   ),
      //   () {
      //     return AuthDataModel(
      //       token: Token(
      //         access: "access",
      //         refresh: "refresh",
      //       ),
      //       user: User(
      //         personalInfo: PersonalInfo(
      //           fullname: "Bimal khatri",
      //           phoneNumber: "9867743236",
      //           email: "bimalkhatri@gmail.com",
      //           dob: "2002-07-07",
      //           gender: "Male",
      //           maritalStatus: "Unmarried",
      //           bloodGroup: "A+",
      //           nationality: "Nepali",
      //           address: "Pokhara",
      //           identificationNo: "50-01-77-01919",
      //           fieldOfStudy: "Bachelor in computing with honours",
      //           institute: "Informatics College",
      //           emergencyContact: "Tulsi khatri",
      //           emergencyPhone: "9867743236",
      //         ),
      //         workInfo: WorkInfo(
      //           employeeId: "01",
      //           userName: "ck-lamib",
      //           dateOfJoining: "2023-03-03",
      //           department: "Developer",
      //           designation: "Flutter Developer",
      //           workPhone: "9867743236",
      //           workEmail: "bimal@aarambhait.com",
      //           workLocation: "Pokhara",
      //           manager: "Summit Pathak",
      //           employeeContractType: "Full-Time",
      //           bankInfo: BankInfo(
      //             bankName: "NIC Asia",
      //             accountName: "Bimal khatri",
      //             accountNumber: "1234567890123456",
      //             branchAddress: "MahendraPool",
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // );