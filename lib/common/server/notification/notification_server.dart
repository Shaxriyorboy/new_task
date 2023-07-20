import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../local/app_storage.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  'notification',
  'Application received',
  description:
  'THis channel is used for showing notifications about applications',
  importance: Importance.max,
);

class NotificationsService {
  NotificationsService._();

  static Future<void> initialize() async {
    if ((await AppStorage().getFCMToken()).isEmpty) {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      AppStorage().setFCMToken(fcmToken ?? "");
    }
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        announcement: true,
        provisional: false,
      );
    }


    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    AndroidInitializationSettings androidNotificationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidNotificationSettings,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {

      },
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
          (remoteMessage) {

      },
    );

    FirebaseMessaging.onMessage.listen(
          (remoteMessage) {
        if (Platform.isAndroid) {
          flutterLocalNotificationsPlugin.show(
            remoteMessage.hashCode,
            remoteMessage.notification?.title,
            remoteMessage.notification?.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                androidChannel.id,
                androidChannel.name,
                channelDescription: androidChannel.description,
                icon: '@mipmap/ic_launcher.png',
                priority: Priority.max,
                importance: Importance.max,
                playSound: true,
              ),
              iOS: const DarwinNotificationDetails(
                presentSound: true,
                presentAlert: true,
                presentBadge: true,
                sound: 'default',
              ),
            ),
          );
        }
      },
    );
  }
}