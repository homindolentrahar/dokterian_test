import 'package:dio/dio.dart';
import 'package:dokterian_test/core/data/remote/api_log_interceptor.dart';
import 'package:dokterian_test/environment.dart';

class AppDio {
  static Dio getDio({
    String? baseUrl,
    Map<String, dynamic> headers = const {},
    InterceptorsWrapper? interceptor,
    String? contentType,
    int connectTimeout = 30,
    int receiveTimeout = 30,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? EnvironmentConf.baseUrl,
        headers: headers,
        connectTimeout: Duration(seconds: connectTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
        contentType: contentType ?? "application/json",
      ),
    );

    dio.interceptors.add(interceptor ?? ApiLogInterceptor());

    return dio;
  }
}
