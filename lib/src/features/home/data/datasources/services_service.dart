import 'package:dio/dio.dart';

class ServicesService {
  final Dio _dio;

  const ServicesService(this._dio);

  Future<Response> getServices() async {
    return _dio.get('/upload/jwaan/services.json');
  }

  Future<Response> chooseService(List<int> selectedServices) async {
    return _dio.post('/upload/jwaan/save_data.php', data: {'selected_service': selectedServices.toString()});
  }
}
