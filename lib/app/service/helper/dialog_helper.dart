import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DialogHelper {
  static get context => null;

  //show error dialog
  static void showErrorDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading() {
    Get.dialog(
      Center(
        child: Container(
          height: 80.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: OverflowBox(
            minHeight: 130.h,
            maxHeight: 130.h,
            child: Lottie.asset(
              'animations/loader.json',
              height: 130.h,
              repeat: true,
              reverse: true,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    Timer(const Duration(seconds: 1), () {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    });
  }
}
