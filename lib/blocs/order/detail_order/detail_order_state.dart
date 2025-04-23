abstract class DetailOrderState {}

class DetailOrderInitialState extends DetailOrderState {}

class DetailOrderLoadingState extends DetailOrderState {}

class DetailOrderLoadedState extends DetailOrderState {
  final Map order;
  DetailOrderLoadedState(this.order);
}

class DetailOrderErrorState extends DetailOrderState {
  final String error;
  DetailOrderErrorState(this.error);
}