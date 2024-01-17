import 'package:jwan_test/src/core/resources/data_state.dart';
import 'package:jwan_test/src/core/usecases/usecase.dart';
import 'package:jwan_test/src/features/home/domain/repositories/service_repository.dart';

class ChooseServicesUseCase implements UseCase<DataState<void>, List<int>> {
  final ServiceRepository _serviceRepository;

  ChooseServicesUseCase(this._serviceRepository);

  @override
  Future<DataState<void>> call({List<int>? params}) {
    return _serviceRepository.chooseService(params ?? []);
  }
}
