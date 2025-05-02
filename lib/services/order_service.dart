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
        HeadersInterceptor({'Authorization': 'Token token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aFR5cGUiOiIiLCJfYnJhbmNoQ29kZSI6MCwiX2lkIjozNTczMzQsIl9pZFRva2VuIjoiMDVjYjYxOTktMTRmYi0xMWYwLWE1YjUtMGFkNjE2MTUwMzAyIiwiX29yZ0lkIjoxNywiZXhwIjoxNzQ2NzY1MTk5LCJvcmlnX2lhdCI6MTc0NjE2MDM5OX0.sna9etgy0kJhx0bRJ5-d_fB0U6IIxBoTtFlUqkl4nII'}),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ]
    );
    return _$OrderService(client);
  }
}
