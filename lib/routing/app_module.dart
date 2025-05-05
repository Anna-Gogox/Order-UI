import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/pages/order_list_page.dart';
import 'package:order_ui/routing/core_module.dart';
import 'package:order_ui/routing/detail_order_module.dart';

class AppModule extends Module{
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => OrderListPage());
    r.module('/order/status', module: DetailOrderModule());
  }
}