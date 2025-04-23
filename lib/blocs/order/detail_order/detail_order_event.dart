abstract class DetailOrderEvent {}

class DetailOrderLoadEvent extends DetailOrderEvent {}

final class DetailOrderRequested extends DetailOrderEvent {
  final int orderId;

  DetailOrderRequested(this.orderId);
}