import 'dart:convert';

class Token {
  final String? refresh;
  final String? access;

  Token({
    this.refresh,
    this.access,
  });

  Token copyWith({
    String? refresh,
    String? access,
  }) =>
      Token(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
      );

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => jsonEncode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
