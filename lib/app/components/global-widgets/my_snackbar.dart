import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../core/navigator_key.dart';

class MySnackBar {
  static void showSnackBar({
    required String title,
    required String message,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(message),
                ],
              ),
            ),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(18),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showErrorSnackBar({
    required String title,
    required String message,
    Color? color,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.error_outline_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(message),
                ],
              ),
            ),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(18),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Colors.redAccent,
      ),
    );
  }

  static void showToast({
    required String message,
    Color? color,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.white,
                size: 22,
              ),
            ),
            Expanded(child: Text(message)),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? const Color(0xff22DD2F),
      ),
    );
  }

  static void showInfoToast({
    required String message,
    Color? color,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            Expanded(child: Text(message)),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? const Color(0xff2E9AFE),
      ),
    );
  }

  static void showErrorToast({
    required String message,
    Color? color,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.error_outline_outlined,
                color: Colors.white,
                size: 22,
              ),
            ),
            Expanded(child: Text(message)),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Colors.red.withOpacity(.9),
      ),
    );
  }

  static void showBottomToast({
    required String message,
    Color? color,
    Duration? duration,
    BuildContext? context,
  }) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            Expanded(child: Text(message)),
          ],
        ),
        duration:
            duration ??
            Duration(seconds: SnackBarDurations.kMySnackBarDuration),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: color ?? const Color(0xff2E9AFE),
      ),
    );
  }
}
