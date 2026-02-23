import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../config/translations/strings_enum.dart';
import '../../components/global-widgets/my_snackbar.dart';
import '../REST/api_exceptions.dart';
import '../graphQL/graphql_service.dart';
import '../helper/dialog_helper.dart';

mixin class ExceptionHandler {
  final GraphQLService graphQLService = GraphQLService();
  RxBool isError = false.obs;

  /// FOR REST API
  void handleError(dynamic error) {
    isError.value = true;
    hideLoading();

    var errorText = DioExceptions.fromDioError(error).toString();

    showErrorDialog(Strings.ohNo.tr, errorText);
    Logger().e(errorText);
  }

  /// FOR GRAPHQL API
  void handleGraphqlError(dynamic error) {
    isError.value = true;
    hideLoading();
    var errorText = graphQLService.errorMessage.toString();

    try {
      Map onlyMessage = jsonDecode(errorText);
      showErrorDialog(Strings.ohNo.tr, onlyMessage["message"]);
      Logger().e(onlyMessage);
    } catch (e) {
      showErrorDialog(Strings.ohNo.tr, errorText);
      Logger().e(errorText);
    }
  }

  void showLoading() {
    isError.value = false;
    DialogHelper.showLoading();
  }

  void hideLoading() {
    DialogHelper.hideLoading();
  }

  void showErrorDialog(String title, String message) {
    /// for toast view
    MySnackBar.showErrorToast(message: message);

    /// for dialog view
    // DialogHelper.showErrorDialog(title, message);
  }
}
