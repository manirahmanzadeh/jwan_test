import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/core/usecases/usecase.dart';
import 'package:jwan_test/src/features/home/domain/entities/service_entity.dart';
import 'package:jwan_test/src/features/home/domain/repositories/service_repository.dart';

class GetServicesUseCase implements UseCase<DataState<List<ServiceEntity>>, void> {
  final ServiceRepository _serviceRepository;

  GetServicesUseCase(this._serviceRepository);

  @override
  Future<DataState<List<ServiceEntity>>> call({void params}) {
    return _serviceRepository.getServices();
  }
}
