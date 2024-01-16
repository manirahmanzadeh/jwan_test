import 'package:get/get.dart';
import 'package:jwan_test/src/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
    ),
  ];
}
