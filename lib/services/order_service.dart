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
        HeadersInterceptor({'Authorization': 'Token token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfYXV0aFR5cGUiOiIiLCJfYnJhbmNoQ29kZSI6MCwiX2lkIjozNTczMDQsIl9pZFRva2VuIjoiMDFiZjY2OGMtZTRlZi0xMWVmLTlhNjctMGFkNjE2MTUwMzAyIiwiX29yZ0lkIjo0MzkxLCJleHAiOjE3NTE2MTc5MzksIm9yaWdfaWF0IjoxNzUxNjE0MzM5fQ.aTOLXsCIEhg8cK8q04DNFto9QFY42Xt5D-PCY-8Rlkk'}),
        HttpLoggingInterceptor(), // this logs requests/responses
        CurlInterceptor(), // this logs requests as cURL
      ]
    );
    return _$OrderService(client);
  }
}
