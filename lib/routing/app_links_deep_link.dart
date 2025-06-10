import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late AppLinks _appLinks;
  //StreamSubscription<Uri>? _linkSubscription;

  void init() {
    _appLinks = AppLinks();
    initDeepLinks();
  }
  
  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialLink();
    if (appLink != null) {
      var uri = Uri.parse(appLink.toString());
      debugPrint(' here you can redirect from url as per your need - $uri');
    }

    // Handle link when app is in warm state (front or background)
    // _linkSubscription = _appLinks.uriLinkStream.listen((uriValue) {
    //   debugPrint(' you will listen any url updates ');
    //   debugPrint(' here you can redirect from url as per your need ');
    // },onError: (err){
    //   debugPrint('====>>> error : $err');
    // },onDone: () {
    //   _linkSubscription?.cancel();
    // },);
    _appLinks.uriLinkStream.listen((uriValue) {
      debugPrint('📦 Received deep link: $uriValue');
      final path = uriValue.path;
      // Example: if uri is myapp://order/123
      if (path.startsWith('/order/')) {
        final orderId = path.replaceFirst('/order/', '');
        debugPrint('🛒 Navigate to order: $orderId');
        // Navigate to the order details screen here
      }
        });
  }
}