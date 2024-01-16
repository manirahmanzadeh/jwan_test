import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/domain/entities/product_entity.dart';
import 'package:jwan_test/src/features/home/domain/usecases/get_products_usecase.dart';

class HomeController extends GetxController {
  final GetProductsUseCase _getProductsUseCase;

  HomeController(this._getProductsUseCase);

  final RxList<ProductEntity> products = <ProductEntity>[].obs;

  final RxBool isLoading = true.obs;
  final Rx<DioException?> dioException = Rx<DioException?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    dioException.value = null;

    final dataState = await _getProductsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      products.assignAll(dataState.data!);
    }

    if (dataState is DataFailed) {
      dioException.value = dataState.error;
    }

    isLoading.value = false;
  }
}
