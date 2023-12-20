import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taskapp/src/utils/custom_color.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class NotificationUtil extends GetxController {
  NotificationUtil({
    required this.message,
  });
  final String message;

  late BuildContext context;
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static snackBarSuccess({required String message}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
  }

  static snackBarError({required String message}) {
    dynamic context;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          // height: Dimensions.heightSize, // Adjust the height as needed
          child: Row(
            children: [
              const Icon(Icons.error, color: CustomColor.redColor),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: CustomColor.whiteColor),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: CustomColor.blackColor,
        duration: const Duration(seconds: 5),
        // margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
        action: SnackBarAction(
          label: '',
          textColor: CustomColor.whiteColor,
          backgroundColor: CustomColor.blackColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // static void toast(String? value,
  //     {ToastGravity? gravity,
  //     length = Toast.LENGTH_SHORT,
  //     Color? bgColor,
  //     Color? textColor,
  //     bool print = false}) {
  //   if (value!.isEmpty || (!kIsWeb && Platform.isLinux)) {
  //     debugPrint(value);
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: value,
  //       gravity: gravity,
  //       toastLength: length,
  //       backgroundColor: bgColor,
  //       textColor: textColor,
  //       timeInSecForIosWeb: 2,
  //     );
  //     if (print) debugPrint(value);
  //   }
  // }
}
