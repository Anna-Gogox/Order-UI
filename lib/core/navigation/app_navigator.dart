import 'package:flutter_modular/flutter_modular.dart';

class AppNavigator {
  static void toOrderDetail(int orderId) {
    Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
    Modular.to.pushNamed('/order/status/$orderId', arguments: {'orderId': orderId});
  }
}
