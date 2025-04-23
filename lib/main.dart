import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/network/network_bloc.dart';
import 'package:order_ui/blocs/network/network_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_bloc.dart';
import 'package:order_ui/core/theme/theme.dart';
import 'package:order_ui/pages/order_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'package:order_ui/services/order_service.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<OrderService>(
      create: (_) => OrderService.create(),
      dispose: (_, OrderService service) => service.client.dispose(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkBloc>(create: (context) => NetworkBloc()..add(NetworkObserve())),
          BlocProvider<OrderListBloc>(
            create:
                (context) => OrderListBloc(
                  Provider.of<OrderService>(context, listen: false),
                ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.lightThemeMode,
          themeMode: ThemeMode.system,
          home: const HomePage(),
        ),
      ),
    );
  }
}
