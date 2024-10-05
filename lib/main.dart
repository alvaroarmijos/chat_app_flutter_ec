import 'package:chat_app_flutter_ec/app/app.dart';
import 'package:chat_app_flutter_ec/app/di/di.dart';
import 'package:chat_app_flutter_ec/app/notifications/notifications_setup.dart';
import 'package:chat_app_flutter_ec/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initDependencies();
  await getIt<NotificationsSetup>().setupNotifications();
  runApp(const App());
}
