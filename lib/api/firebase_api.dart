import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseMessagingService {
  static const String tag = 'FCM';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    final apnsToken = await _firebaseMessaging.getAPNSToken();
    final fCMToken = await _firebaseMessaging.getToken();
    log('APNs token: $apnsToken', name: tag);
    log('FCM token: $fCMToken', name: tag);

    // Initialize Local Notifications
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iOSInit,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          log('Data payload: ${response.payload}', name: tag);
          if (response.payload != null) {
            _handlePayloadFromLocalNotification(response.payload!);
          }
        }
      },
    );

    _firebaseMessaging.getInitialMessage().then((message) {
      log("App is launched from terminated state", name: tag);
      _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("App is opened from background via notification", name: tag);
      _handleMessage(message);
    });

    FirebaseMessaging.onMessage.listen((message) {
      log("Foreground message received", name: tag);
      _showLocalNotification(message);
    });
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    // Android settings
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'General notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    // iOS settings
    const iOSDetails = DarwinNotificationDetails(
      presentAlert: true, // Show alert
      presentBadge: true, // Show badge count
      presentSound: true, // Play sound
    );

    const platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    final notification = message.notification;

    if (notification != null) {
      await _localNotifications.show(
        message.hashCode,
        notification.title ?? 'No title',
        notification.body ?? "No body",
        platformDetails,
        payload: jsonEncode(message.data),
      );
    }
  }

  void _handleMessage(RemoteMessage? message) {
    if (message != null) {
      log('Notification payload: ${message.notification}', name: tag);
      log('Data payload: ${message.data}', name: tag);

      final orderId = message.data['orderId'];
      if (orderId != null) {
        _navigateToOrderDetail(orderId);
      }
    }
  }

  void _handlePayloadFromLocalNotification(String payload) {
    log('Tapped notification with payload: $payload', name: tag);

    try {
      final Map<String, dynamic> data = jsonDecode(payload);
      final orderId = int.tryParse(data['orderId'] ?? '');

      if (orderId != null) {
        _navigateToOrderDetail(orderId);
      } else {
        log('No orderId found in payload', name: tag);
      }
    } catch (e) {
      log('Error parsing payload: $e', name: tag);
    }
  }

  void _navigateToOrderDetail(int orderId) {
    Modular.to.pushNamed(
      '/order/status/$orderId',
      arguments: {'orderId': orderId},
    );
  }
}
