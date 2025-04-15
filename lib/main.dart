import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/theme.dart';
import 'package:order_ui/features/order/presentation/pages/order_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: const ColorScheme(
      //     primary: Color(0xFF0088BF),
      //     brightness: Brightness.light, 
      //     onPrimary: Colors.white, 
      //     secondary: Color(0xFFFAEC8A), 
      //     onSecondary: Colors.black, 
      //     error: Color(0xFFEA5265), 
      //     onError: Colors.white, 
      //     surface: Color(0xFFFFFFFF),
      //     onSurface: Colors.black,
      //     surfaceContainer: Color(0xFFF5F5F5), 
      //     surfaceContainerHighest: Color(0xFFAEAEAE),
      //     surfaceContainerHigh: Color(0xFFDEDEDE),
      //   ),
      //   fontFamily: 'Roboto',
      //   useMaterial3: true,
      // ),
      // darkTheme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color(0xFF005085),
      //     brightness: Brightness.dark,
      //   ),
      //   useMaterial3: true,
      // ),
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
