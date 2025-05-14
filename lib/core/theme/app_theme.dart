import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/app_palette.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {

  AppTheme({
    required this.background,
    required this.appBarBackground,
    required this.heading1,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.caption,
    required this.palette,
  });

  static const heading1Style = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const title1Style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const title2Style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const subtitle1Style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const subtitle2Style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const body1Style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const captionStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  @override
  final Color background;
  @override
  final Color appBarBackground;
  @override
  final TextStyle heading1;
  @override
  final TextStyle title1;
  @override
  final TextStyle title2;
  @override
  final TextStyle subtitle1;
  @override
  final TextStyle subtitle2;
  @override
  final TextStyle body1;
  @override
  final TextStyle caption;
  @override
  final AppPalette palette;
} 

const lightPalette = AppPalette(
  primary: Color(0xFF0088BF),
  secondary: Color(0xFFFAEC8A),
  danger: Color(0xFFEA5265),
  success: Color(0xFF00AEB1),
  neutral0: Color(0xFF000000),
  neutral1: Color(0xFF313F46),
  neutral2: Color(0xFFDEDEDE),
  neutral3: Color(0xFFAEAEAE),
  neutral4: Color(0xFFF5F5F5),
  neutral5: Color(0xFF00121A),
  status1: Color(0xFF22ADEF),
  status2: Color(0xFF79CB65),
  status3: Color(0xFFDB1F21),
  status4: Color(0xFF0981E0),
);

final lightAppTheme = AppTheme(
  background: lightPalette.neutral4,
  appBarBackground: Colors.white,
  heading1: AppTheme.heading1Style,
  title1: AppTheme.title1Style,
  title2: AppTheme.title2Style,
  subtitle1: AppTheme.subtitle1Style,
  subtitle2: AppTheme.subtitle2Style,
  body1: AppTheme.body1Style,
  caption: AppTheme.captionStyle,
  palette: lightPalette,
);