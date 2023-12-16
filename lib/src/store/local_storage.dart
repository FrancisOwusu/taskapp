import 'package:get_storage/get_storage.dart';
import 'package:taskapp/src/utils/logger.dart';

const String idKey = "idKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";
final log = logger(LocalStorage);

class LocalStorage {
  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    log.d(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }
}
