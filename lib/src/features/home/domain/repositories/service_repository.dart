import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';

abstract class ServiceRepository {
  Future<DataState<List<ServiceEntity>>> getServices();

  Future<DataState<void>> chooseService(List<int> selectedServices);
}
