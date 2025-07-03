import 'package:chopper/chopper.dart';

part 'order_service.chopper.dart';

@ChopperApi(baseUrl: '/order')
abstract class OrderService extends ChopperService{

  @GET(path: '/history')
  Future<Response> getOrders({
    @Query("filter") String filter = "all",
  });

  @GET(path: '/status')
  Future<Response> getOrderById(@Query('order_id') int id);

  static OrderService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://stage-app-api.gogox.com/'),
      services: [_$OrderService()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Authorization': 'Token token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aFR5cGUiOiIiLCJfYnJhbmNoQ29kZSI6MCwiX2lkIjozNTczMDQsIl9pZFRva2VuIjoiMDFiZjY2OGMtZTRlZi0xMWVmLTlhNjctMGFkNjE2MTUwMzAyIiwiX29yZ0lkIjo0MzkxLCJleHAiOjE3NTE1Mjg2ODEsIm9yaWdfaWF0IjoxNzUxNTI1MDgxfQ.e8yKrUR41TNtr5M_333ulh1S_8fGtBIHxlXm3rRQuLw'}),
        HttpLoggingInterceptor(), // this logs requests/responses
        CurlInterceptor(), // this logs requests as cURL
      ]
    );
    return _$OrderService(client);
  }
}
