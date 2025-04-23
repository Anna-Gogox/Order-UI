import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_event.dart';
import 'package:order_ui/blocs/order/detail_order/detail_order_state.dart';
import 'package:order_ui/services/order_service.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {

  final OrderService orderService;

  DetailOrderBloc(this.orderService) : super( DetailOrderInitialState() ) {
    on<DetailOrderRequested>((event, emit) async {
      emit(DetailOrderLoadingState());
      try {
        final response = await orderService.getOrderById(event.orderId);
        if (response.isSuccessful) {
          emit(DetailOrderLoadedState(response.body));
        } else {
          emit(DetailOrderErrorState('Error: ${response.error}'));
        }
      } catch (e) {
        emit(DetailOrderErrorState('Error: ${e.toString()}'));
      }
    });
  }
}

