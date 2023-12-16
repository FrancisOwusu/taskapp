import 'package:get/get.dart';
import 'package:taskapp/src/feature/account/domain/auth_model.dart';
import 'package:taskapp/src/feature/account/domain/register_model.dart';
import 'package:taskapp/src/utils/api_methods.dart';
import 'package:taskapp/src/utils/api_util.dart';
import 'package:taskapp/src/utils/logger.dart';
import 'package:taskapp/src/utils/notification_util.dart';

final log = logger(AccountController);

class AccountController {
  bool _isLoading = false;
  // Future<AuthModel> logInApi(Map request, {bool isSocialLogin = false}) async {
  // Response response = await buildHttpResponse(
  //     isSocialLogin ? 'social-login' : 'login',
  //     request: request,
  //     method: HttpMethod.POST);

  // if (!(response.statusCode >= 200 && response.statusCode <= 206)) {
  //   if (response.body.isJson()) {
  //     var json = jsonDecode(response.body);

  //     if (json.containsKey('code') &&
  //         json['code'].toString().contains('invalid_username')) {
  //       throw 'invalid_username';
  //     }
  //   }
  // }
  // }
  static Future<RegisterModel?> signUp(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiUtil.registrationUrl,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        RegisterModel loginModel = RegisterModel.fromJson(mapResponse);
        return loginModel;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞jjjj err from login api service ==> ${e.runtimeType}. 🐞🐞🐞');
      // NotificationUtil.snackBarError(
      //     message: 'Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

//!Login Api method
  static Future<AuthModel?> loginApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiUtil.loginUrl,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        log.i(mapResponse);
        AuthModel loginModel = AuthModel.fromJson(mapResponse);
        return loginModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from login api service ==> $e 🐞🐞🐞');
      NotificationUtil.snackBarError(
          message: 'Something went Wrong! in LoginModel');
      return null;
    }
    return null;
  }

  //!Logout Api method
  // static Future<CommonSuccessModel?> logOut() async {
  //   Map<String, dynamic>? mapResponse;
  //   try {
  //     mapResponse = await ApiMethod(isBasic: false).get(
  //       ApiEndpoint.logOutURL,
  //       code: 200,
  //     );
  //     if (mapResponse != null) {
  //       CommonSuccessModel logOutModel =
  //           CommonSuccessModel.fromJson(mapResponse);
  //       return logOutModel;
  //     }
  //   } catch (e) {
  //     log.e('🐞🐞🐞 err from log out api service ==> $e 🐞🐞🐞');
  //     CustomSnackBar.error('Something went Wrong! in logout model');
  //     return null;
  //   }
  //   return null;
  // }

// Login process function
  // Future<AuthModel> loginProcess() async {
  //   _isLoading.value = true;
  //   update();

  //   Map<String, dynamic> inputBody = {
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //   };
  //   // calling login api from api service
  //   await ApiServices.loginApi(body: inputBody).then((value) {
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
}
