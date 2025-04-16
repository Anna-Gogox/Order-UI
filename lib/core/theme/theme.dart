import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/app_pallete.dart';
import 'package:order_ui/core/theme/custom_theme/text_theme.dart';

class AppTheme {
//   static final lightThemeMode = ThemeData.light().copyWith(
//     scaffoldBackgroundColor: AppPallete.neutral4,
//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: AppPallete.primary,
//       onPrimary: Colors.white,
//       secondary: AppPallete.secondary,
//       onSecondary: Colors.black,
//       error: AppPallete.danger,
//       onError: Colors.white,
//       surface: Colors.white,
//       onSurface: Colors.black,
//       surfaceContainer: AppPallete.neutral4,
//     ),
//   );
//   static final darkThemeMode = ThemeData.dark();

  AppTheme._();

  static ThemeData lightThemeMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: AppPallete.primary,
    scaffoldBackgroundColor: AppPallete.neutral4,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkThemeMode = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: AppPallete.primary,
    scaffoldBackgroundColor: AppPallete.neutral0,
    textTheme: AppTextTheme.darkTextTheme,
  );
} 