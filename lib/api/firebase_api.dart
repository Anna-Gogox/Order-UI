import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseApi {
  
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotification() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    String? apnsToken = await _firebaseMessaging.getAPNSToken();
    debugPrint('APNs token: $apnsToken');

    // fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token
    debugPrint('Token: $fCMToken');
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotification();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message == null) return;

  Modular.to.pushNamed('/user/me/1');
}

Future initPushNotification() async {
  // handle notification if the app was terminated and now opened
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  
  // attach event listeners for when a notification opens the app
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}