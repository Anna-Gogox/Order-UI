import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeepLink {
    DeepLink._privateConstructor();

  static final DeepLink _instance =
      DeepLink._privateConstructor();

  static DeepLink get instance => _instance;

  Uri? _initialUri;            // <- NEW
  bool _initialStreamSkipped = false;
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSub;

  Future<void> init() async {
    _appLinks = AppLinks();
    await _initDeepLinks();   // <-- CHỜ xong
  }

  Future<void> _initDeepLinks() async {
    _initialUri = await _appLinks.getInitialLink();
    if (_initialUri != null) {
      debugPrint('onAppLink(cold state): $_initialUri');
    }

    _linkSub = _appLinks.uriLinkStream.listen((uri) {
      // Bỏ sự kiện đầu nếu trùng initialUri
      if (!_initialStreamSkipped &&
          _initialUri != null &&
          uri == _initialUri) {
        _initialStreamSkipped = true;
        return;                    
      }
      debugPrint('onAppLink(warm state): $uri');
      openAppLink(uri);
    }, onError: (err) => debugPrint('error: $err'));
  }

  void processPendingDeepLink() {
    if (_initialUri != null) {
      openAppLink(_initialUri!);
    }
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
