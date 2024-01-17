import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFC2185B),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFC2185B),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFEEEEEE),
      onSecondary: Color(0xFF373435),
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    fontFamily: 'IS',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'IS'),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'IS'),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'IS'),
    ),
  );
}
