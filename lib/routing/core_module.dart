import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/services/order_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<OrderService>(() => OrderService.create());
  }
}