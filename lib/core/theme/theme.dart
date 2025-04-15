import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.neutral4,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppPallete.primary,
      onPrimary: Colors.white,
      secondary: AppPallete.secondary,
      onSecondary: Colors.black,
      error: AppPallete.danger,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      surfaceContainer: AppPallete.neutral4,
    ),
  );
  static final darkThemeMode = ThemeData.dark();
} 