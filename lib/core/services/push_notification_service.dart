import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_service.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<void> init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log(token ?? "no token");
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessagingHandler);
    handleForegroundMessage();
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // show local notification
      LocalNotificationService.showBasicNotification(message);
    });
  }

  static Future<void> onBackgroundMessagingHandler(
    RemoteMessage remoteMessage,
  ) async {
    await Firebase.initializeApp();
    log(remoteMessage.notification?.title ?? "no title");
  }
}
