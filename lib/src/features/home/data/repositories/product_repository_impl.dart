import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/data/datasources/products_service.dart';
import 'package:jwan_test/src/features/home/domain/entities/product_entity.dart';
import 'package:jwan_test/src/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsService _productsService;

  const ProductRepositoryImpl(this._productsService);

  @override
  Future<DataState<List<ProductEntity>>> fetchProducts() async {
    try {
      final httpResponse = await _productsService.fetchProducts();
      if (httpResponse.statusCode == HttpStatus.ok) {
        final articlesList = httpResponse.data
            .where(
              (element) => element.title != '[Removed]' && element.urlToImage != null,
            )
            .toList();
        return DataSuccess(articlesList);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.requestOptions,
            error: httpResponse.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse,
          ),
        );
      }
    } on DioException catch (e) {
      log(e.toString());
      return DataFailed(e);
    }
  }
}
