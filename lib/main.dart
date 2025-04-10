import 'package:flutter/material.dart';
import 'package:order_ui/gen/colors.gen.dart';
import 'package:order_ui/pages/home_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorName.primary,
          brightness: Brightness.light
        ),
        useMaterial3: true, 
      ),
      home: const HomePage(),
    );
  }
}
