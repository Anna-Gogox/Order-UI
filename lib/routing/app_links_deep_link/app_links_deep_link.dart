import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  void init() {
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final appLink =
        await _appLinks
            .getInitialLink(); // Checks if the app was launched via a deep link. If yes, you receive the link as appLink.
    if (appLink != null) {
      final uri = Uri.parse(appLink.toString());
      debugPrint('onAppLink(cold state): $uri');
      openAppLink(uri);
      return;
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('onAppLink(warm state): $uri');
        openAppLink(uri);
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }

  Future<void> openAppLink(Uri uri) async {
  final path = uri.path;
  final orderId = uri.queryParameters['order_id'];

  if (path == '/status' && orderId != null) {
    debugPrint('navigateTo: $uri');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToOrderDetail(int.parse(orderId));
    });
  }
}
  
  void _navigateToOrderDetail(orderId) {
    debugPrint('Navigating to order detail with ID: $orderId');
    Modular.to.pushNamed('/order/status/$orderId');
  }

}
