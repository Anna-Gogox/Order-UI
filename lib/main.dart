import 'package:flutter/material.dart';
import 'package:order_ui/core/theme/theme.dart';
import 'package:order_ui/pages/order_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => OrderService.create(),
      dispose: (_, OrderService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightThemeMode,
        //darkTheme: AppTheme.darkThemeMode,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
