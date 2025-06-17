import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logging/logging.dart';
import 'package:order_ui/api/firebase_api.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_event.dart';
import 'package:order_ui/core/theme/app_theme.dart';
import 'package:order_ui/l10n/app_localizations.dart';
import 'package:order_ui/routing/app_links_deep_link/app_links_deep_link.dart';
import 'package:order_ui/routing/app_module.dart';

void main() async{
  _setupLogging();

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(); 

  // Initialize Firebase notifications
  await FirebaseApi().initNotification(); 

  runApp(ModularApp(module: AppModule(), child: MyApp()));

  // Initialize deep links
  AppLinksDeepLink.instance.init(); 
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeModeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    final lightThemeData = ThemeData(
      brightness: Brightness.light,
      extensions: [lightAppTheme],
    );

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (_, themeMode, __) {
        return BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(NetworkObserve()),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: lightThemeData,
            themeMode: themeMode,
            routerConfig: Modular.routerConfig,
          ),
        );
      },
    );
  }
}
