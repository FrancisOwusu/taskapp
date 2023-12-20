import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/src/feature/account/domain/auth_model.dart';
import 'package:taskapp/src/feature/account/domain/register_model.dart';
import 'package:taskapp/src/feature/account/service/account_service.dart';
import 'package:taskapp/src/store/local_storage.dart';

import 'package:taskapp/src/utils/logger.dart';
import 'package:taskapp/src/utils/notification_util.dart';

final log = logger(AccountController);

class AccountController extends GetxController {
  AccountController({required this.isBasic});

  bool isBasic; //!loading api

  // Login process function
  // static Future<AuthModel> loginProcess(
  //     {required Map<String, dynamic> body}) async {
  //   Map<String, dynamic>? mapResponse;
  //   // calling login api from api service
  //   await AccountService.signUp(body).then((value) {
  //     _loginModel = value!;

  //     debugPrint("Email Verified => Login Process");

  //     twoFaStatus.value = _loginModel.data.user.twoFactorStatus;
  //     twoFaVerified.value = _loginModel.data.user.twoFactorVerified;

  //     if (_loginModel.data.user.emailVerified == 0) {
  //       isEmailVerification.value = false;

  //       LocalStorage.saveToken(token: loginModel.data.token.toString());

  //       _goToEmailVerification(_loginModel);
  //     } else {
  //       _goToSavedUser(_loginModel);

  //       /// this is for 2fa check
  //       if (twoFaStatus.value == 1 && twoFaVerified.value == 0) {
  //         debugPrint("1 : 0");
  //         debugPrint("1 : 0");
  //         debugPrint("1 : 0");
  //         debugPrint("1 : 0");
  //         Get.toNamed(Routes.otp2FaScreen);
  //       } else {
  //         LocalStorage.isLoginSuccess(isLoggedIn: true);
  //         LocalStorage.isLoggedIn();
  //         update();
  //         Get.offAllNamed(Routes.bottomNavBarScreen);
  //       }
  //     }

  //     _isLoading.value = false;
  //     update();
  //   }).catchError((onError) {
  //     log.e(onError);
  //   });

  //   _isLoading.value = false;
  //   update();
  //   return _loginModel;
  // }

  static Future<RegisterModel> signUpProcess(Map<String, dynamic> body) async {
    //!loading api
    late RegisterModel _registerModel;

    await AccountService.signUp(body).then((value) {
      _registerModel = value!;
      if (_registerModel.token.isNotEmpty || _registerModel.token != '') {
        String? token = _registerModel.token;
        LocalStorage.saveToken(token: token.toString());
        LocalStorage.isLoginSuccess(
          isLoggedIn: true,
        );
        LocalStorage.isLoggedIn();
        return _registerModel;
      }
    }).catchError((onError) {
      log.e(onError);
    });
    return _registerModel;
    // _isLoading.value = false;
    // update();
    // return log.i(_loginModel);
  }
}
