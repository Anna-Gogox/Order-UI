part of 'order_service.dart';

final class _$OrderService extends OrderService {
  _$OrderService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrderService;

  @override
  Future<Response<dynamic>> getOrders({
    String filter = 'all',
    int page = 1,
  }) {
    final Uri $url = Uri.parse('/order/history');
    final Map<String, dynamic> $params = <String, dynamic>{
      'filter': filter,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getOrderById(int id) {
    final Uri $url = Uri.parse('/order/$id');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
