import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'hi';
    super.onRequest(options, handler);
  }
}
