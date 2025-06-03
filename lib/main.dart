import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/api/firebase_api.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_event.dart';
import 'package:order_ui/core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:order_ui/routing/app_links_deep_link.dart';
import 'package:order_ui/routing/app_module.dart';
import 'package:order_ui/services/notification_service.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService.instance.initialize();
  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseApi().initNotification(); // Initialize Firebase notifications
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeModeNotifier = ValueNotifier(ThemeMode.light);
  final AppLinksDeepLink _appLinksDeepLink = AppLinksDeepLink.instance; // Initialize AppLinksDeepLink instance

  @override
  Widget build(BuildContext context) {
    final lightThemeData = ThemeData(
      brightness: Brightness.light,
      extensions: [lightAppTheme],
    );
    _appLinksDeepLink.init();  // Initialize deep links when the app starts

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (_, themeMode, __) {
        return Provider<OrderService>(
          create: (_) => OrderService.create(),
          dispose: (_, OrderService service) => service.client.dispose(),
          child: BlocProvider<NetworkBloc>(
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
          ),
        );
      }
    );
  }
}
