import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  /// SnackBar ///

  static showCustomSnackBar(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(18),
      borderRadius: 50,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  static showCustomErrorSnackBar(
      {required String title,
      required String message,
      Color? color,
      Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(18),
      borderRadius: 50,
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      snackPosition: SnackPosition.TOP,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  /// Toast ///

  static showCustomToast(
      {required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? const Color(0xff61cd80),
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
          size: 22,
        ),
      ),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
    );
  }

  static showCustomInfoToast(
      {required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

      backgroundColor: color ?? const Color(0xff2E9AFE),

      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.info_outline_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }

  static showCustomErrorToast(
      {required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(milliseconds: 3000),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? const Color(0xffd91b82),
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
          size: 22,
        ),
      ),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
    );
  }
}
