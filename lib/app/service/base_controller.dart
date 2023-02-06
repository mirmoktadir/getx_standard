import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../components/custom_snackbar.dart';
import 'api_exceptions.dart';
import 'helper/dialog_helper.dart';

class BaseController {
  RxBool isError = false.obs;
  void handleError(error) {
    hideLoading();
    isError.value = true;
    var errorText = DioExceptions.fromDioError(error).toString();
    Timer(const Duration(milliseconds: 700), () {
      CustomSnackBar.showCustomErrorToast(title: "Error", message: errorText);
    });

    if (kDebugMode) {
      print(errorText);
    }
  }

  showLoading() {
    isError.value = false;
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
