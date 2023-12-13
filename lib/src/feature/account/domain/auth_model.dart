import 'dart:convert';

class AuthModel {
  final String email;
  final String password;
  const AuthModel({required this.email, required this.password});

  // factory LoginModel.fromJson(Map<String, dynamic> json) {
  //   return LoginModel(email = json['email'], password = json['password']);
  // }
  AuthModel.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String,
        password = json['password'] as String;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
