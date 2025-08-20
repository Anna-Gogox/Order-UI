import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    String? apnsToken = await _firebaseMessaging.getAPNSToken();
    debugPrint('APNs token: $apnsToken');

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();
    debugPrint('Token: $fCMToken');

    // Handle notification tap when app is killed (terminated)
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleMessage(message);
      }
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  void _handleMessage(RemoteMessage message) {
    debugPrint('Payload: ${message.data.toString()}');
    final orderId = message.data['orderId'];
    if (orderId != null) {
      Modular.to.pushNamed(
        '/order/status/$orderId',
        arguments: {'orderId': orderId},
      );
    }
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}
