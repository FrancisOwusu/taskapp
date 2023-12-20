import 'package:get_storage/get_storage.dart';
import 'package:taskapp/src/utils/logger.dart';

const String idKey = "idKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String showAdKey = "showAdKey";
const String splashImgKey = "splashImgKey";
const String isLoggedInKey = "isLoggedInKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String language = "language";

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

  static Future<void> saveId({required int id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final box = GetStorage();

    await box.remove(idKey);

    // await box.remove(nameKey);

    await box.remove(emailKey);

    // await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    // await box.remove(isOnBoardDoneKey);
  }
}
