import 'package:flutter/material.dart';
import 'package:taskapp/src/utils/custom_color.dart';

class NotificationUtil {
  //  late final String message;
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

  static snackBarError(BuildContext context, {required String message}) {
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
}
