// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.token,
    required this.refreshToken,
    required this.role,
  });

  final String token;
  final String refreshToken;
  final String role;

  Token copyWith({
    required String token,
    required String refreshToken,
    required String role,
  }) =>
      Token(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        role: role ?? this.role,
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        refreshToken: json["refreshToken"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "role": role,
      };
}
