import 'package:taskapp/src/feature/account/domain/auth_model.dart';
import 'package:taskapp/src/feature/account/domain/register_model.dart';
import 'package:taskapp/src/store/local_storage.dart';
import 'package:taskapp/src/utils/api_methods.dart';
import 'package:taskapp/src/utils/api_util.dart';
import 'package:taskapp/src/utils/logger.dart';

final log = logger(AccountService);

class AccountService {
  AccountService({required this.isBasic});

  bool isBasic;
  static Future<RegisterModel?> signUp(Map<String, dynamic> body) async {
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
      return null;
    }
    return null;
  }

  static void signOut() {
    LocalStorage.logout();
    LocalStorage.isLoggedIn();
  }
}
