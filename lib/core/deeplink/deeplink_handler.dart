import 'package:flutter/material.dart';

import 'deeplink_routes.dart';

void openAppLink(Uri uri) {
  for (final route in routes) {
    if (route.matcher(uri)) {
      route.handler(uri);
      return;
    }
  }
  debugPrint('No route found for ${uri.path}');
}
