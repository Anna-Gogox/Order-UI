import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/utils/order_status_helper.dart';

class OrderModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<OrderStatusHelper>(OrderStatusHelper.new);
  }
}
