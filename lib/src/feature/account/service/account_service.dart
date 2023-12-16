import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/src/utils/api_util.dart';
// import 'package:taskapp/src/feature/account/domain/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:taskapp/src/utils/logger.dart';

final log = logger(AccountService);

class AccountService {
//get token
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post(ApiEndpoint.loginUrl,
          data: {'email': email, 'password': password});
      log.i(response);
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200 && response.data != '') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

  Future<dynamic> registerUser(
      String username, String email, String password) async {
    try {
      var user = await Dio().post(ApiEndpoint.registrationUrl,
          data: {'email': email, 'password': password});
      if (kDebugMode) {
        print(user);
      }
      if (user.statusCode == 201 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }
}
