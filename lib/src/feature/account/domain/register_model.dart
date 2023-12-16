import 'dart:convert';

class RegisterModel {
  final int id;
  final String token;
  const RegisterModel({required this.id, required this.token});

  RegisterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };
}
