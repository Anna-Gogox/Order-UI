import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// class DeepLink {
//   DeepLink._privateConstructor();

//   static final DeepLink _instance =
//       DeepLink._privateConstructor();

//   static DeepLink get instance => _instance;

//   late AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSubscription;

//   // Add this as a class variable to store the initial link
//   Uri? _pendingInitialLink;

//   void dispose() {
//     _linkSubscription?.cancel();
//   }

//   Future<void> init() async {
//     _appLinks = AppLinks();
//     await initDeepLinks();
//   }

//   Future<void> initDeepLinks() async {
//     // Check for initial link but don't navigate yet
//     final initialLink = await _appLinks.getInitialLink();
//     if (initialLink != null) {
//       _pendingInitialLink = Uri.parse(initialLink.toString());
//       debugPrint('onAppLink(cold state): $_pendingInitialLink');
//     }

//     // Set up listener for when app is already running
//     _linkSubscription = _appLinks.uriLinkStream.listen(
//       (uri) {
//         debugPrint('onAppLink(warm state): $uri');
//         openAppLink(uri);
//       },
//       onError: (err) {
//         debugPrint('====>>> error : $err');
//       },
//     );
//   }

//   // Call this method after your app is fully initialized
//   void processPendingDeepLink() {
//     if (_pendingInitialLink != null) {
//       debugPrint('Processing pending deep link: $_pendingInitialLink');

//       if (Platform.isIOS) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           openAppLink(_pendingInitialLink!);
//           _pendingInitialLink = null; // Clear it after processing
//         });
//       } else {
//         openAppLink(_pendingInitialLink!);
//         _pendingInitialLink = null;
//       }
//     }
//   }

//  Future<void> openAppLink(Uri uri) async {
//     final path = uri.path;
//     final orderId = uri.queryParameters['order_id'];

//     if (path == '/status' && orderId != null) {
//       debugPrint('navigateTo: $uri');

//       _navigateToOrderDetail(int.parse(orderId));
//     } 
//   }

//   void _navigateToOrderDetail(int orderId) {
//     debugPrint('Navigating to order detail with ID: $orderId');

//     Modular.to.pushNamedAndRemoveUntil(
//       '/',
//       (route) => false,
//     );
//     Modular.to.pushNamed(
//       '/order/status/$orderId',
//       arguments: {'orderId': orderId},
//     );
//   }

// }


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
    _initialUri = await _appLinks.getInitialLink();   // 1️⃣ lưu lại
    if (_initialUri != null) {
      debugPrint('onAppLink(cold state): $_initialUri');
    }

    _linkSub = _appLinks.uriLinkStream.listen((uri) {
      // 2️⃣ Bỏ sự kiện đầu nếu trùng initialUri
      debugPrint('Dieu kien: $_initialStreamSkipped  $_initialUri  $uri');
      if (!_initialStreamSkipped &&
          _initialUri != null &&
          uri == _initialUri) {
        _initialStreamSkipped = true;
        return;                    // skip duplicate
      }
      debugPrint('onAppLink(warm state): $uri');
      openAppLink(uri);
    }, onError: (err) => debugPrint('error: $err'));
  }

  void processPendingDeepLink() {
    if (_initialUri != null) {
      openAppLink(_initialUri!);   // 3️⃣ chỉ navigate 1 lần
      _initialUri = null;          // clear *sau* khi listener đã sẵn sàng
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
