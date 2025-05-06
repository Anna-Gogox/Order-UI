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
        HeadersInterceptor({'Authorization': 'Token token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aFR5cGUiOiIiLCJfYnJhbmNoQ29kZSI6MCwiX2lkIjozNTQ0NDMsIl9pZFRva2VuIjoiMmJiMWJjY2ItMjRkYy0xMWYwLWFjZTgtMGFhODUzNzczNWMzIiwiX29yZ0lkIjoxMiwiZXhwIjoxNzQ3MTA1ODg1LCJvcmlnX2lhdCI6MTc0NjUwMTA4NX0.fPacXAgAS7vy6e5OPWWHiVDv3XK2eYY-jyDS8eG1up0'}),
        HttpLoggingInterceptor(),
        CurlInterceptor(),
      ]
    );
    return _$OrderService(client);
  }
}
