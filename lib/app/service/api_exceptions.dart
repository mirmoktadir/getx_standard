import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = "";
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request cancelled!";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout!";
        break;
      case DioErrorType.other:
        message = "Connection problem!";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout!";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!.toInt(), dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout!";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['error'] ?? error["message"] ?? 'Bad request';
      case 404:
        return error['error'] ?? error["message"] ?? "Api Url Incorrect";
      case 500:
        return error['error'] ?? error["message"] ?? "Internal Server Error";
      default:
        return error['error'] ?? error["message"] ?? 'Something went wrong';
    }
  }

  @override
  String toString() => message;
}
