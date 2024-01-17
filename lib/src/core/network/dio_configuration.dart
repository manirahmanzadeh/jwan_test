import 'package:dio/dio.dart';
import 'package:jwan_test/src/core/constants/constants.dart';

import 'interceptors/auth_interceptor.dart';

class AppDio {
  static late final Dio dio;

  static Dio init() {
    final options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }
}
