import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';
import 'package:jwan_test/src/features/home/domain/usecases/choose_services.dart';
import 'package:jwan_test/src/features/home/domain/usecases/get_services.dart';

class HomeController extends GetxController {
  final GetServicesUseCase _getServicesUseCase;
  final ChooseServicesUseCase _chooseServicesUseCase;

  HomeController(this._getServicesUseCase, this._chooseServicesUseCase);

  RxList<ServiceEntity> services = <ServiceEntity>[].obs;
  RxList<ServiceEntity> selectedServices = <ServiceEntity>[].obs;
  RxBool isLoading = true.obs;
  RxBool isSending = false.obs;
  Rx<DioException?> dioException = Rx<DioException?>(null);

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

  selectService(ServiceEntity serviceEntity) {
    if (selectedServices.contains(serviceEntity)) {
      selectedServices.remove(serviceEntity);
    } else {
      selectedServices.add(serviceEntity);
    }
  }

  sendServices() async {
    if (selectedServices.isNotEmpty) {
      isSending.value = true;
      dioException.value = null;

      final dataState = await _chooseServicesUseCase(params: selectedServices.map((element) => element.id).toList());

      if (dataState is DataSuccess) {
        Get.snackbar('موفق', 'رزرو شما انجام شد');
      }

      if (dataState is DataFailed) {
        dioException.value = dataState.error;
        Get.snackbar('خطا', 'مشکل سرور');
      }

      isSending.value = false;
    } else {
      Get.snackbar('خطا', 'لطفا خدمات مورد نظر خود را انتخاب کنید');

    }
  }
}
