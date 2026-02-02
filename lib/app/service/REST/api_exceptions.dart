import 'package:dio/dio.dart';

import '../../../config/translations/strings_enum.dart';

class DioExceptions implements Exception {
  String message = "";

  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = Strings.requestCanceled;
        break;
      case DioExceptionType.connectionTimeout:
        message = Strings.connectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = Strings.receiveTimeout;
        break;
      case DioExceptionType.sendTimeout:
        message = Strings.sendTimeout;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response!.statusCode!.toInt(),
          dioException.response!.data,
        );
        break;

      default:
        message = Strings.somethingWrong;
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    if (error is Map) {
      return (error['error'] ??
              error["message"] ??
              _defaultErrorMessage(statusCode))
          .toString();
    } else if (error is String) {
      final isHtml =
          error.contains('<!DOCTYPE html>') || error.contains('<html');
      return isHtml
          ? _defaultErrorMessage(statusCode)
          : (error.isNotEmpty ? error : _defaultErrorMessage(statusCode));
    } else {
      return _defaultErrorMessage(statusCode);
    }
  }

  String _defaultErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return Strings.badRequest;
      case 401:
        return Strings.unauthorized;
      case 404:
        return Strings.urlIncorrect;
      case 500:
        return Strings.internalServerError;
      default:
        return Strings.somethingWrong;
    }
  }

  @override
  String toString() => message;
}
