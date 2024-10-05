import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initDependencies();
  await getIt<NotificationsSetup>().setupNotifications();
  runApp(const App());
}
