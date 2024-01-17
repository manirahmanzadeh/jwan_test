import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/data/datasources/services_service.dart';
import 'package:jwan_test/src/features/home/data/models/service_model.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';
import 'package:jwan_test/src/features/home/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServicesService _servicesService;

  const ServiceRepositoryImpl(this._servicesService);

  @override
  Future<DataState<List<ServiceEntity>>> getServices() async {
    try {
      final httpResponse = await _servicesService.getServices();

      if (httpResponse.statusCode == HttpStatus.ok) {
        final servicesRawList = httpResponse.data as List;
        final servicesList = servicesRawList
            .map(
              (e) => ServiceModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return DataSuccess(servicesList);
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

  @override
  Future<DataState<void>> chooseService(List<int> selectedServices) async {
    try {
      final httpResponse = await _servicesService.chooseService(selectedServices);

      if (httpResponse.statusCode == HttpStatus.ok) {
        return const DataSuccess('ok');
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
