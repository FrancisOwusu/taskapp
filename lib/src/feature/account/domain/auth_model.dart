import 'dart:convert';

class AuthModel {
  final String token;

  AuthModel({required this.token});

  // factory LoginModel.fromJson(Map<String, dynamic> json) {
  //   return LoginModel(email = json['email'], password = json['password']);
  // }
  AuthModel.fromJson(Map<String, dynamic> json) : token = json['token'];

  Map<String, dynamic> toJson() => {'token': token};
}
