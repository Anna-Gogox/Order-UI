import 'dart:ui';

import 'package:flutter/material.dart';

// class AppPallete {
//   static const Color primary = Color(0xFF0088BF);
//   static const Color secondary = Color(0xFFFAEC8A);
//   static const Color background = Color(0xFFF5F5F5);
//   static const Color danger = Color(0xFFEA5265);
//   static const Color success = Color(0xFF00AEB1);
//   static const Color neutral1 = Color(0xFF313F46);
//   static const Color neutral2 = Color(0xFFDEDEDE);
//   static const Color neutral3 = Color(0xFFAEAEAE);
//   static const Color neutral4 = Color(0xFFF5F5F5);
//   static const Color neutral5 = Color(0xFF00121A);
//   static const Color neutral0 = Color(0xFF000000);
//   static const Color status1 = Color(0xFF22ADEF);
//   static const Color status2 = Color(0xFF79CB65);
//   static const Color status3 = Color(0xFFDB1F21);
//   static const Color status4 = Color(0xFF0981E0);
// }

class AppPallete {
  final Color primary;
  final Color secondary;
  final Color danger;
  final Color success;
  final Color neutral0;
  final Color neutral1;
  final Color neutral2;
  final Color neutral3;
  final Color neutral4;
  final Color neutral5;
  final Color status1;
  final Color status2;
  final Color status3;
  final Color status4;

  const AppPallete({
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.success,
    required this.neutral0,
    required this.neutral1,
    required this.neutral2,
    required this.neutral3,
    required this.neutral4,
    required this.neutral5,
    required this.status1,
    required this.status2,
    required this.status3,
    required this.status4,
  });
}
