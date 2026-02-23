// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_header.dart';

enum HttpMethod { get, post, put, patch, delete }

/// Single HTTP client for all REST calls. Use [request] for GET/POST/PUT/PATCH/DELETE
/// and [download] for file downloads.
///
/// ## JSON requests (GET, POST, PUT, PATCH, DELETE)
///
/// ```dart
/// final client = DioClient();
///
/// // GET
/// var data = await client.request(
///   method: HttpMethod.get,
///   url: 'https://api.example.com/items',
///   queryParams: {'page': 1},
/// );
///
/// // POST with JSON body
/// var created = await client.request(
///   method: HttpMethod.post,
///   url: 'https://api.example.com/items',
///   body: {'name': 'Item', 'type': 'food'},
/// );
///
/// // PUT / PATCH / DELETE same way with [method] and optional [body].
/// ```
///
/// ## Multipart (file upload)
///
/// Build [FormData] and pass it as [body]. Dio sends it as multipart/form-data.
///
/// **Single file:**
/// ```dart
/// final formData = FormData.fromMap({
///   'title': 'My document',
/// });
/// formData.files.add(MapEntry(
///   'file',
///   await MultipartFile.fromFile(file.path, filename: 'doc.pdf'),
/// ));
/// var result = await client.request(
///   method: HttpMethod.post,
///   url: 'https://api.example.com/upload',
///   body: formData,
/// );
/// ```
///
/// **Multiple files (e.g. document[]):**
/// ```dart
/// final formData = FormData.fromMap({'userId': '123'});
/// for (final file in fileList) {
///   formData.files.add(MapEntry(
///     'document[]',
///     await MultipartFile.fromFile(file.path),
///   ));
/// }
/// var result = await client.request(
///   method: HttpMethod.post,
///   url: 'https://api.example.com/upload',
///   body: formData,
/// );
/// ```
///
/// ## Download file
///
/// Use [download] (different from [request]): it writes the response to disk
/// and returns the saved [File].
///
/// ```dart
/// final file = await client.download(
///   url: 'https://api.example.com/file.pdf',
///   savePath: '/path/to/save/file.pdf',
///   params: {'token': 'xyz'},
/// );
/// if (file != null) {
///   // open or use file
/// }
/// ```
class DioClient {
  static const int TIME_OUT_DURATION = 20;

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: TIME_OUT_DURATION),
    receiveTimeout: const Duration(seconds: TIME_OUT_DURATION),
    sendTimeout: const Duration(seconds: TIME_OUT_DURATION),
  ))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

  /// Single method for GET, POST, PUT, PATCH, DELETE.
  /// [body] can be a Map/list (sent as JSON) or [FormData] for multipart uploads.
  Future<dynamic> request({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParams,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final options = Options(headers: headers ?? Header.rapidApiHeader);
      final data = _buildData(body);

      Response response;
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            url,
            options: options,
            queryParameters: queryParams,
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            url,
            options: options,
            queryParameters: queryParams,
            data: data,
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            url,
            options: options,
            queryParameters: queryParams,
            data: data,
          );
          break;
        case HttpMethod.patch:
          response = await _dio.patch(
            url,
            options: options,
            queryParameters: queryParams,
            data: data,
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            url,
            options: options,
            queryParameters: queryParams,
            data: data,
          );
          break;
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  dynamic _buildData(dynamic body) {
    if (body == null) return null;
    if (body is FormData) return body;
    return json.encode(body);
  }

  /// Downloads the [url] to [savePath]. Returns the saved [File] on success.
  /// For normal API responses use [request] instead.
  Future<File?> download({
    required String url,
    Map<String, dynamic>? params,
    required String savePath,
    Map<String, String>? headers,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(headers: headers ?? Header.rapidApiHeader),
        queryParameters: params,
      );
      return File(savePath);
    } catch (e) {
      rethrow;
    }
  }
}
