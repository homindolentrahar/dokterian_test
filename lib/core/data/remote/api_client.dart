import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dokterian_test/app_injection.dart';
import 'package:dokterian_test/core/data/remote/api_response.dart';
import 'package:dokterian_test/core/data/remote/app_dio.dart';
import 'package:dokterian_test/core/util/secure_storage_manager.dart';
import 'package:dokterian_test/environment.dart';

enum ApiMethod {
  get("GET"),
  post("POST"),
  put("PUT"),
  patch("PATCH"),
  delete("DELETE");

  final String title;

  const ApiMethod(this.title);
}

class ApiClient {
  Future<Map<String, dynamic>?> requestData({
    required String endpoint,
    required ApiMethod method,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
  }) async {
    final contentType = isMultipart ? 'multipart/form-data' : null;
    final Map<String, dynamic> newHeaders = {
      'Accept': 'application/json',
    };

    dynamic data = body;
    newHeaders.addAll(headers);

    final token = await injector.get<SecureStorageManager>().getToken() ?? "";
    if (!newHeaders.containsKey("Authorization") && token.isNotEmpty) {
      newHeaders['Authorization'] = "Bearer $token";
    }

    if (isMultipart) {
      for (MapEntry<String, dynamic> entry in body.entries) {
        if (entry.value is File) {
          final File file = body[entry.key] as File;
          body[entry.key] = dio.MultipartFile.fromFileSync(
            file.path,
            filename: file.path.split(Platform.pathSeparator).last,
          );
        }
      }

      data = dio.FormData.fromMap(body);
    }

    final client = AppDio.getDio();
    final options = dio.Options(
      method: method.title,
      headers: newHeaders,
      contentType: contentType,
    )
        .compose(
          client.options,
          endpoint,
          data: data,
          queryParameters: queryParams,
        )
        .copyWith(baseUrl: EnvironmentConf.baseUrl);

    final result = await client.fetch<Map<String, dynamic>>(options);

    return result.data;
  }

  Future<ApiResponse<T>> requestObject<T>({
    required String endpoint,
    required ApiMethod method,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
    d,
  }) async {
    final result = await requestData(
      endpoint: endpoint,
      method: method,
      body: body,
      headers: headers,
      queryParams: queryParams,
      isMultipart: isMultipart,
    );

    return ApiResponse<T>.fromJson(result ?? {});
  }

  Future<ApiResponseList<T>> requestList<T>({
    required String endpoint,
    required ApiMethod method,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
  }) async {
    final result = await requestData(
      endpoint: endpoint,
      method: method,
      body: body,
      headers: headers,
      queryParams: queryParams,
      isMultipart: isMultipart,
    );

    return ApiResponseList<T>.fromJson(result ?? {});
  }

  Future<ApiResponsePrimitive<T>> requestPrimitive<T>({
    required String endpoint,
    required ApiMethod method,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
    d,
  }) async {
    final result = await requestData(
      endpoint: endpoint,
      method: method,
      body: body,
      headers: headers,
      queryParams: queryParams,
      isMultipart: isMultipart,
    );

    return ApiResponsePrimitive<T>.fromJson(result ?? {});
  }
}
