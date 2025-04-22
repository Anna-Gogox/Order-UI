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
        //HttpLoggingInterceptor(),
        CurlInterceptor(),
        // (Request request) async {
        //   if (request.method == HttpMethod.Post) {
        //     chopperLogger.info('Performed a POST request');
        //   }
        //   return request;
        // },
        // (Response response) async {
        //   if (response.statusCode == 404) {
        //     chopperLogger.severe('404 Not Found');
        //   }
        //   return response;
        // }
      ]
    );
    return _$OrderService(client);
  }
}