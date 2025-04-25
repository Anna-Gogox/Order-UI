import 'package:chopper/chopper.dart';

part 'order_service.chopper.dart';

@ChopperApi(baseUrl: '/order')
abstract class OrderService extends ChopperService{
  @GET(path: '/history')
  Future<Response> getOrders({
    @Query("filter") String filter = "all",
    @Query('page') int page = 1,
  });

  @GET(path: '/{id}')
  Future<Response> getOrderById(@Path('id') int id);

  static OrderService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://stage-app-api.gogox.com/'),
      services: [_$OrderService()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Authorization': 'Token token='}),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ]
    );
    return _$OrderService(client);
  }
}
