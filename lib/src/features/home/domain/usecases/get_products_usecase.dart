import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/core/usecases/usecase.dart';
import 'package:jwan_test/src/features/home/domain/entities/product_entity.dart';
import 'package:jwan_test/src/features/home/domain/repositories/product_repository.dart';

class GetProductsUseCase implements UseCase<DataState<List<ProductEntity>>, Map<String, dynamic>> {
  final ProductRepository _articleRepository;

  GetProductsUseCase(this._articleRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({Map<String, dynamic>? params}) {
    return _articleRepository.fetchProducts();
  }
}
