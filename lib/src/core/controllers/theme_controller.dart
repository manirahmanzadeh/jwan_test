import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwan_test/src/config/theme/theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeData get currentTheme => isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    isDarkMode.toggle();
  }
}
