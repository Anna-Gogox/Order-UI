import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
import 'package:order_ui/models/order.dart';
import 'package:order_ui/services/order_service.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {

  final OrderService orderService;
  int _page = 1;

  OrderListBloc(this.orderService) : super(OrderListState()) {
    on<OrderListFetchEvent>(_onFetchOrders);
    on<OrderListLoadMoreEvent>(_onLoadMoreOrders);
    on<OrderListRefreshEvent>(_onRefreshOrders);
  }

  Future<void> _onFetchOrders(
    OrderListFetchEvent event,
    Emitter<OrderListState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, filter: event.filter));
    try {
      final response = await orderService.getOrders(filter: event.filter, page: 1);
      final List<dynamic> data = response.body;
      final List<Order> orders =
          data.map((json) => Order.fromJson(json)).toList();
      _page = 2;

      emit(
        state.copyWith(
          isLoading: false,
          orders: orders,
          hasMore: orders.length >= 10,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Error - Failed to fetch orders: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onLoadMoreOrders(
    OrderListLoadMoreEvent event,
    Emitter<OrderListState> emit,
  ) async {
    if (state.isLoading || !state.hasMore) return;
    emit(state.copyWith(isLoading: true));

    try {
      final response = await orderService.getOrders(filter: state.filter, page: _page);
      final List<dynamic> data = response.body;
      final List<Order> moreOrders =
          data.map((json) => Order.fromJson(json)).toList();
      _page++;

      emit(
        state.copyWith(
          orders: [...state.orders, ...moreOrders],
          hasMore: moreOrders.length >= 10,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Error - Failed to load more orders: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onRefreshOrders(OrderListRefreshEvent event, Emitter<OrderListState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final response = await orderService.getOrders(filter: state.filter, page: 1);
      final List<dynamic> data = response.body;
      final List<Order> orders = data.map((json) => Order.fromJson(json)).toList();
      _page = 2;

      emit(
        state.copyWith(
          isLoading: false,
          orders: orders,
          hasMore: orders.length >= 10,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Error - Failed to refresh orders: ${e.toString()}',
        ),
      );
    }
  }
}