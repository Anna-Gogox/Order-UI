import 'package:chopper/chopper.dart';

part 'order_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class OrderService extends ChopperService{
  @GET()
  Future<Response> getOrders(Map<String, String> map);

  @GET(path: '/{id}')
  Future<Response> getOrderById(@Path('id') int id);

  @POST()
  Future<Response> createOrder(@Body() Map<String, dynamic> order);

  static OrderService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
      services: [_$OrderService()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ]
    );
    return _$OrderService(client);
  }
}