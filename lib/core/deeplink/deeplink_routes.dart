import 'package:order_ui/core/navigation/app_navigator.dart';

import 'route_rule.dart';

final List<RouteRule> routes = [
  RouteRule(
    (uri) => uri.path == '/status' && uri.queryParameters['order_id'] != null,
    (uri) => AppNavigator.toOrderDetail(int.parse(uri.queryParameters['order_id']!)),
  ),
];
