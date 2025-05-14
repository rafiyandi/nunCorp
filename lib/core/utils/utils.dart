import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static showSnackbar(
      {required String message,
      Color? bgColor,
      int? durationSecond,
      Duration? duration,
      EdgeInsets? margin,
      String? title}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(GetSnackBar(
        title: title ?? 'Mohon Maaf',
        backgroundColor: bgColor ?? Colors.red,
        message: message,
        maxWidth: 1170,
        duration: duration ?? Duration(seconds: durationSecond ?? 3),
        snackStyle: SnackStyle.FLOATING,
        margin: margin ?? const EdgeInsets.all(24),
        borderRadius: 24,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    } else {
      Get.closeCurrentSnackbar();
    }
  }
}
