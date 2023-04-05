import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_standard/config/translations/strings_enum.dart';

import 'api_exceptions.dart';
import 'helper/dialog_helper.dart';

class BaseController {
  RxBool isError = false.obs;

  void handleError(error) {
    isError.value = true;
    hideLoading();
/**/
    var errorText = DioExceptions.fromDioError(error).toString();

    showErrorDialog(Strings.oops.tr, errorText);

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

  showErrorDialog(String title, String message) {
    DialogHelper.showErrorDialog(title, message);
  }
}
