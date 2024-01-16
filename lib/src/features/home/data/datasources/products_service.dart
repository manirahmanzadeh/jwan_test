import 'package:dio/dio.dart';

class ProductsService {
  final Dio _dio = Dio();

  Future<Response> fetchProducts() async {
    return _dio.get('https://api.example.com/products');
  }
}
