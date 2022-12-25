// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 20;

  //GET

  Future<dynamic> get(String url, Map<String, dynamic> header) async {
    var uri = Uri.parse(url);

    try {
      var response = await Dio()
          .get(url, options: Options(headers: header))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST

  Future<dynamic> post(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var uri = Uri.parse(url);
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .post(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //PATCH

  Future<dynamic> patch(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var uri = Uri.parse(url);
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .patch(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE

  Future<dynamic> delete(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var uri = Uri.parse(url);
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .delete(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //MULTIPART

  List<File>? docFileList = [];
  Future<dynamic> multipartRequest(
    String url,
    Map<String, dynamic> header,
    Map<String, dynamic> payload,
    String? filepath,
  ) async {
    var uri = Uri.parse(url);
    var formData = FormData.fromMap(payload);
    for (var files in docFileList!) {
      filepath = files.path;
      formData.files.addAll(
          [MapEntry("document[]", await MultipartFile.fromFile(filepath))]);
    }

    try {
      var response = await Dio()
          .post(url, options: Options(headers: header), data: formData)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  ///

  Future<dynamic> multipartSingleFile(String url, Map<String, dynamic> header,
      Map<String, dynamic> payload, String? filepath, String key) async {
    var uri = Uri.parse(url);
    var formData = FormData.fromMap(payload);
    if (filepath != null) {
      formData.files.add(MapEntry(key, await MultipartFile.fromFile(filepath)));
    }

    try {
      var response = await Dio()
          .post(url, options: Options(headers: header), data: formData)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// download file
  // static download(
  //     {required String url, // file url
  //     required String savePath, // where to save file
  //     Function(ApiException)? onError,
  //     Function(int value, int progress)? onReceiveProgress,
  //     required Function onSuccess}) async {
  //   try {
  //     await _dio.download(
  //       url,
  //       savePath,
  //       options: Options(receiveTimeout: 999999, sendTimeout: 999999),
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     onSuccess();
  //   } catch (error) {
  //     var exception = ApiException(url: url, message: error.toString());
  //     onError?.call(exception) ?? _handleError(error.toString());
  //   }
  // }

  //OTHER

  dynamic _processResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
