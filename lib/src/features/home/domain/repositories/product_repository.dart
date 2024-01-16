import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> fetchProducts();
}
