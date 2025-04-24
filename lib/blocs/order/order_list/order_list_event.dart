abstract class OrderListEvent {}

class OrderListFetchEvent extends OrderListEvent {}

class OrderListLoadMoreEvent extends OrderListEvent {}

class OrderListRefreshEvent extends OrderListEvent {}