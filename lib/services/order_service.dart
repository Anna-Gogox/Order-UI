import 'package:chopper/chopper.dart';

part 'order_service.chopper.dart';

@ChopperApi(baseUrl: '/order')
abstract class OrderService extends ChopperService{

  @GET(path: '/history')
  Future<Response> getOrders({
    @Query("filter") String filter = "all",
    @Query('page') int page = 1,
  });

  @GET(path: '/status')
  Future<Response> getOrderById(@Query('order_id') int id);

  static OrderService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://stage-app-api.gogox.com/'),
      services: [_$OrderService()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Authorization': 'Token token='}),
        HttpLoggingInterceptor(), // this logs requests/responses
        CurlInterceptor(), // this logs requests as cURL
      ]
    );
    return _$OrderService(client);
  }
}
