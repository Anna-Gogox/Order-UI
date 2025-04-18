import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/theme.dart';
import 'package:order_ui/pages/order_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightThemeMode,
      //darkTheme: AppTheme.darkThemeMode,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
