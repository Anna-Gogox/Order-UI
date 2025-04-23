abstract class OrderListState {}

class OrderListInitialState extends OrderListState {}

class OrderListLoadingState extends OrderListState {}

class OrderListLoadedState extends OrderListState {
  final List<dynamic> orders;

  OrderListLoadedState(this.orders);
}

class OrderListErrorState extends OrderListState {
  final String error;

  OrderListErrorState(this.error);
}