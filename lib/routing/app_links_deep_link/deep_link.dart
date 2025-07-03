import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeepLink {
  DeepLink._privateConstructor();

  static final DeepLink _instance =
      DeepLink._privateConstructor();

  static DeepLink get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  // Add this as a class variable to store the initial link
  Uri? _pendingInitialLink;

  void dispose() {
    _linkSubscription?.cancel();
  }

  void init() {
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    // Check for initial link but don't navigate yet
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _pendingInitialLink = Uri.parse(initialLink.toString());
    }

    // Set up listener for when app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('onAppLink(warm state): $uri');
        openAppLink(uri);
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
    );
  }

  // Call this method after your app is fully initialized
  void processPendingDeepLink() {
    if (_pendingInitialLink != null) {
      debugPrint('Processing pending deep link: $_pendingInitialLink');

      if (Platform.isIOS) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          openAppLink(_pendingInitialLink!);
          _pendingInitialLink = null; // Clear it after processing
        });
      } else {
        openAppLink(_pendingInitialLink!);
          _pendingInitialLink = null;
      }
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

}
