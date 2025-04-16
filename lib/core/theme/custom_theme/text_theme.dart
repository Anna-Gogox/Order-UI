import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
    headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
    headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  );
}