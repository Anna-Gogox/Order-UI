import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:order_ui/core/deeplink/deeplink_handler.dart';

class DeepLinkService {
  StreamSubscription<Uri>? _linkSub;

  Future<void> initDeepLinks() async {
    _linkSub = AppLinks().uriLinkStream.listen((uri) {
      openAppLink(uri);
    }, onError: (err) => debugPrint('error: $err'));
  }

  Future<void> dispose() async => _linkSub?.cancel();
}
