import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeepLink {
    DeepLink._privateConstructor();

  static final DeepLink _instance =
      DeepLink._privateConstructor();

  static DeepLink get instance => _instance;

  StreamSubscription<Uri>? _linkSub;

  Future<void> initDeepLinks() async {
    _linkSub = AppLinks().uriLinkStream.listen((uri) {
      openAppLink(uri);
    }, onError: (err) => debugPrint('error: $err'));
  }

  Future<void> openAppLink(Uri uri) async {
    final path = uri.path;
    final orderId = uri.queryParameters['order_id'];

    if (path == '/status' && orderId != null) {
      debugPrint('navigateTo: $uri');

      _navigateToOrderDetail(int.parse(orderId));
    }
  }

  void _navigateToOrderDetail(int orderId) {
    debugPrint('Navigating to order detail with ID: $orderId');

    Modular.to.pushNamedAndRemoveUntil(
      '/',
      (route) => false,
    );
    Modular.to.pushNamed(
      '/order/status/$orderId',
      arguments: {'orderId': orderId},
    );
  }

  Future<void> dispose() async => _linkSub?.cancel();
}
