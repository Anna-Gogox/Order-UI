import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_event.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_state.dart';
import 'package:order_ui/services/order_service.dart';

class DetailOrderListBloc extends Bloc<DetailOrderListEvent, DetailOrderListState> {

  final OrderService orderService;

  DetailOrderListBloc(this.orderService) : super( DetailOrderListInitialState() ) {
    on<DetailOrderListLoadEvent>((event, emit) async {
      emit(DetailOrderListLoadingState());
      try {
        final response = await orderService.getOrders({});
        if (response.isSuccessful) {
          emit(DetailOrderListLoadedState(response.body));
        } else {
          emit(DetailOrderListErrorState('Error: ${response.error}'));
        }
      } catch (e) {
        emit(DetailOrderListErrorState('Error: ${e.toString()}'));
      }
    });
  }
}

