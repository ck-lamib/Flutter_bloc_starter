import 'dart:convert';

import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';

class AuthDataModel {
  final Token? token;
  final User? user;

  AuthDataModel({
    this.token,
    this.user,
  });

  AuthDataModel copyWith({
    Token? token,
    User? user,
  }) =>
      AuthDataModel(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory AuthDataModel.fromRawJson(String str) =>
      AuthDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}
