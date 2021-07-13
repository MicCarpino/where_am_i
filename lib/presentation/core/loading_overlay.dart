import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:where_am_i/core/utils/constants.dart';

class LoadingOverlay {
  static bool isShowing = false;

  static Future<T> show<T extends Object>(BuildContext context) {
    isShowing = true;
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: dncBlue.withOpacity(0.8),
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: dncLightBlue,
        ),
      ),
    );
  }

  static void dismissIfShowing(BuildContext context) {
    if (isShowing) {
      Navigator.of(context).pop();
      isShowing = false;
    }
  }
}
