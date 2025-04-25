abstract class OrderListEvent {}

class OrderListFetchEvent extends OrderListEvent {
  final String filter;

  OrderListFetchEvent({this.filter = 'all'});
}

class OrderListLoadMoreEvent extends OrderListEvent {}

class OrderListRefreshEvent extends OrderListEvent {}