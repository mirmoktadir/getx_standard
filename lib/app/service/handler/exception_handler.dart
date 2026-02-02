import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../config/translations/strings_enum.dart';
import '../../core/navigator_key.dart';
import '../../components/global-widgets/my_snackbar.dart';
import '../REST/api_exceptions.dart';
import '../graphQL/graphql_service.dart';
import '../helper/dialog_helper.dart';

mixin ExceptionHandler {
  final GraphQLService graphQLService = GraphQLService();

  void handleError(Ref ref, dynamic error) {
    hideLoading(ref);
    final errorText = DioExceptions.fromDioError(error).toString();
    showErrorDialog(ref, Strings.ohNo, errorText);
    Logger().e(errorText);
  }

  void handleGraphqlError(Ref ref, dynamic error) {
    hideLoading(ref);
    final errorText = graphQLService.errorMessage.toString();
    try {
      final onlyMessage = jsonDecode(errorText) as Map;
      showErrorDialog(
        ref,
        Strings.ohNo,
        onlyMessage["message"]?.toString() ?? errorText,
      );
      Logger().e(onlyMessage);
    } catch (e) {
      showErrorDialog(ref, Strings.ohNo, errorText);
      Logger().e(errorText);
    }
  }

  void showLoading(Ref ref) {
    final context = rootNavigatorKey.currentContext;
    if (context != null) DialogHelper.showLoading(context);
  }

  void hideLoading(Ref ref) {
    final context = rootNavigatorKey.currentContext;
    if (context != null) DialogHelper.hideLoading(context);
  }

  void showErrorDialog(Ref ref, String title, String message) {
    MySnackBar.showErrorToast(message: message);
  }
}
