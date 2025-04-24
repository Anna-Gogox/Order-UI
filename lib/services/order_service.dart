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
        HeadersInterceptor({'Authorization': 'Token token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aFR5cGUiOiIiLCJfYnJhbmNoQ29kZSI6MCwiX2lkIjozNTQ0NDMsIl9pZFRva2VuIjoiMzM2YzdiZGEtMjBmNC0xMWYwLThhNDktMGE5OGM1YWJkY2QzIiwiX29yZ0lkIjoxMiwiZXhwIjoxNzQ2MDk0MTY1LCJvcmlnX2lhdCI6MTc0NTQ4OTM2NX0.WfQsO1X_Bo0vsv2MmL96_ZDI9qqUzuXi82gmMaOKhDw'}),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ]
    );
    return _$OrderService(client);
  }
}