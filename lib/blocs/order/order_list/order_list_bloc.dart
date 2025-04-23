import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
import 'package:order_ui/services/order_service.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {

  final OrderService orderService;
  OrderListLoadedState? _cachedState;

  OrderListBloc(this.orderService) : super( OrderListInitialState() ) {
    on<OrderListLoadEvent>((event, emit) async {
      emit(OrderListLoadingState());
      try {
        final response = await orderService.getOrders({});
        if (response.isSuccessful) {
          _cachedState = OrderListLoadedState(response.body);
          emit(OrderListLoadedState(response.body));
        } else {
          emit(OrderListErrorState('Error: ${response.error}'));
        }
      } catch (e) {
        if (_cachedState != null) {
          emit(_cachedState!);
        } else {
          emit(OrderListErrorState('Error: ${e.toString()}'));
        }
        //emit(OrderListErrorState('Error: ${e.toString()}'));
      }
    });
  }

}
