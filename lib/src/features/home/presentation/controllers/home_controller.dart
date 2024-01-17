import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';
import 'package:jwan_test/src/features/home/domain/usecases/get_services.dart';

class HomeController extends GetxController {
  final GetServicesUseCase _getServicesUseCase;

  HomeController(this._getServicesUseCase);

  final RxList<ServiceEntity> services = <ServiceEntity>[].obs;
  final RxBool isLoading = true.obs;
  final Rx<DioException?> dioException = Rx<DioException?>(null);

  @override
  void onInit() {
    super.onInit();
    getServices();
  }

  Future<void> getServices() async {
    isLoading.value = true;
    dioException.value = null;

    final dataState = await _getServicesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      services.assignAll(dataState.data!);
    }

    if (dataState is DataFailed) {
      dioException.value = dataState.error;
    }

    isLoading.value = false;
  }
}
