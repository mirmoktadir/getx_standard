// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  static const int TIME_OUT_DURATION = 20;

  //GET

  Future<dynamic> get(String url, Map<String, dynamic> header) async {
    try {
      var response = await Dio()
          .get(url, options: Options(headers: header))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //POST

  Future<dynamic> post(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .post(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH

  Future<dynamic> patch(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .patch(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE

  Future<dynamic> delete(
      String url, Map<String, dynamic> header, dynamic payloadObj) async {
    var payload = json.encode(payloadObj);
    try {
      var response = await Dio()
          .delete(url, options: Options(headers: header), data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR MULTIPLE FILE UPLOAD

  List<File>? docFileList = [];
  Future<dynamic> multipartRequest(
    String url,
    Map<String, dynamic> header,
    Map<String, dynamic> payload,
    String? filepath,
  ) async {
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
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR SINGLE FILE UPLOAD

  Future<dynamic> multipartSingleFile(String url, Map<String, dynamic> header,
      Map<String, dynamic> payload, String? filepath, String key) async {
    var formData = FormData.fromMap(payload);
    if (filepath != null) {
      formData.files.add(MapEntry(key, await MultipartFile.fromFile(filepath)));
    }

    try {
      var response = await Dio()
          .post(url, options: Options(headers: header), data: formData)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
