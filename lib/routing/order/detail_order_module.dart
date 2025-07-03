import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_bloc.dart';
import 'package:order_ui/pages/detail_order_page.dart';
import 'package:order_ui/services/order_service.dart';

class DetailOrderModule extends Module {

  @override
  void binds(i) {
    i.add<DetailOrderBloc>(
      () => DetailOrderBloc(Modular.get<OrderService>()),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/:orderId',
      child: (_) {
        final id = int.parse(r.args.params['orderId']);
        return DetailOrderScreen(orderId: id);
      },
      transition: TransitionType.rightToLeft,
    );

  }
}