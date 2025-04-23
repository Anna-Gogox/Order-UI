abstract class DetailOrderListState {}

class DetailOrderListInitialState extends DetailOrderListState {}

class DetailOrderListLoadingState extends DetailOrderListState {}

class DetailOrderListLoadedState extends DetailOrderListState {
  final order;

  DetailOrderListLoadedState(this.order);
}

class DetailOrderListErrorState extends DetailOrderListState {
  final String error;

  DetailOrderListErrorState(this.error);
}