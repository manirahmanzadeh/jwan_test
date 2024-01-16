import 'package:get/get.dart';
import 'package:jwan_test/src/core/controllers/theme_controller.dart';
import 'package:jwan_test/src/features/home/data/datasources/products_service.dart';
import 'package:jwan_test/src/features/home/data/repositories/product_repository_impl.dart';
import 'package:jwan_test/src/features/home/domain/repositories/product_repository.dart';
import 'package:jwan_test/src/features/home/domain/usecases/get_products_usecase.dart';

registerDependencies() {
  Get.put<ThemeController>(ThemeController());

  Get.put<ProductsService>(ProductsService());

  Get.put<ProductRepository>(ProductRepositoryImpl(Get.find()));

  Get.put<GetProductsUseCase>(GetProductsUseCase(Get.find()));
}
