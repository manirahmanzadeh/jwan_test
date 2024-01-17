import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/controllers/theme_controller.dart';
import 'package:jwan_test/src/core/network/dio_configuration.dart';
import 'package:jwan_test/src/features/home/data/datasources/services_service.dart';
import 'package:jwan_test/src/features/home/data/repositories/service_repository_impl.dart';
import 'package:jwan_test/src/features/home/domain/repositories/service_repository.dart';
import 'package:jwan_test/src/features/home/domain/usecases/get_services.dart';

registerDependencies() {
  Get.put<ThemeController>(ThemeController());

  final dio = AppDio.init();
  Get.put<Dio>(dio);

  Get.put<ServicesService>(ServicesService(Get.find()));

  Get.put<ServiceRepository>(ServiceRepositoryImpl(Get.find()));

  Get.put<GetServicesUseCase>(GetServicesUseCase(Get.find()));
}
