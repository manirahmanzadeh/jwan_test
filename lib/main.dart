import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/config/routes/routes.dart';
import 'package:jwan_test/src/core/locator/locator.dart';

import 'src/core/controllers/theme_controller.dart';
import 'src/features/home/presentation/bindings/home_binding.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My GetX Project',
      theme: Get.find<ThemeController>().currentTheme,
      initialBinding: HomeBinding(),
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}
