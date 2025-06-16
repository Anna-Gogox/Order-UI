import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_ui/blocs/order/order_list/order_list_event.dart';
import 'package:order_ui/blocs/order/order_list/order_list_state.dart';
import 'package:order_ui/models/order.dart';
import 'package:order_ui/services/order_service.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {

  final OrderService orderService;

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
      final response = await orderService.getOrders(filter: event.filter);
      final List<dynamic> data = response.body;
      final List<Order> orders =
          data.map((json) => Order.fromJson(json)).toList();

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
    if (!state.hasMore) return;

    try {
      final response = await orderService.getOrders(filter: state.filter);
      final List<dynamic> data = response.body;
      final List<Order> moreOrders =
          data.map((json) => Order.fromJson(json)).toList();

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
      final response = await orderService.getOrders(filter: state.filter);
      final List<dynamic> data = response.body;
      final List<Order> orders = data.map((json) => Order.fromJson(json)).toList();

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