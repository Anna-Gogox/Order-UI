import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/pages/order_list_page.dart';
import 'package:order_ui/routing/core_module.dart';
import 'package:order_ui/routing/order/detail_order_module.dart';
import 'package:order_ui/routing/order/order_module.dart';
import 'package:order_ui/routing/user/user_module.dart';

class AppModule extends Module{
  @override
  List<Module> get imports => [
    CoreModule(),
    OrderModule(),
  ];

  @override
  void routes(r) {
    r.child('/', child: (context) => OrderListPage());
    r.module('/order/status', module: DetailOrderModule());
    r.module('/user/me', module: UserModule());
  }
}