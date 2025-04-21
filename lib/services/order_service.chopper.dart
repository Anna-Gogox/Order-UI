part of 'order_service.dart';

final class _$OrderService extends OrderService {
  _$OrderService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrderService;

  @override
  Future<Response<dynamic>> getOrders(Map<String, String> queryParams) {
    final Uri $url = Uri.parse('/posts').replace(queryParameters: queryParams);
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getOrderById(int id) {
    final Uri $url = Uri.parse('/posts/${id}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createOrder(Map<String, dynamic> order) {
    final Uri $url = Uri.parse('/posts');
    final $body = order;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
