import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsSetup {
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'chat',
    'Chat Notifications',
    description: 'Channel used for new message notifications',
    importance: Importance.high,
  );

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> setupNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _messaging.requestPermission();
  }

  void showNotification(RemoteMessage notification) {
    final RemoteNotification? remoteNotification = notification.notification;
    AndroidNotification? androidNotification = remoteNotification?.android;
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (remoteNotification != null && androidNotification != null) {
      flutterLocalNotificationsPlugin.show(
        remoteNotification.hashCode,
        remoteNotification.title,
        remoteNotification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  }
}
