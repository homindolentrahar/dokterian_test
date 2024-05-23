import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("### REQUEST ###");
    final method = options.method.toUpperCase();
    debugPrint("$method -> ${options.uri}");
    debugPrint("Headers: ${options.headers}");
    if (options.data is FormData) {
      debugPrint("Data: ${(options.data as FormData).fields}");
    } else {
      debugPrint("Data: ${options.data}");
    }
    debugPrint("### END REQUEST ###");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map<String, dynamic>) {
      if (response.data['response']['dataResponse'] != null) {
        response.data['response']['data'] =
            response.data['response']['dataResponse'];
        response.data['response']['dataResponse'] = null;
      }

      if (response.data['response']['name'] != null) {
        response.data['response']['data'] = response.data['response']['name'];
        response.data['response']['name'] = null;
      }

      if (response.data['response']['token'] != null) {
        response.data['response']['data'] = response.data['response']['token'];
        response.data['response']['token'] = null;
      }
    }

    debugPrint("### RESPONSE ###");
    debugPrint("${response.statusCode} -> ${response.requestOptions.uri}");
    debugPrint("Headers: ${response.headers}");
    debugPrint("Response: ${response.data}");
    debugPrint("### END RESPONSE ###");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("### ERROR ###");
    debugPrint("${err.response?.statusCode} -> ${err.requestOptions.uri}");
    debugPrint("Error: ${err.error}");
    debugPrint("Message: ${err.message}");
    debugPrint("Response: ${err.response}");
    debugPrint("### END ERROR ###");

    return super.onError(err, handler);
  }
}
