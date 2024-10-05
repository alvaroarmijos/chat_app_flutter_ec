import 'package:chat_app_flutter_ec/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_flutter_ec/app/di/di.dart';
import 'package:chat_app_flutter_ec/app/home/home.dart';
import 'package:chat_app_flutter_ec/app/notifications/notifications_setup.dart';
import 'package:chat_app_flutter_ec/app/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _lifecycleListener;
  late final HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();

    _lifecycleListener = AppLifecycleListener(
      onResume: () => homeBloc.add(UpdateUserStatusEvent(status: true)),
      onPause: () => homeBloc.add(UpdateUserStatusEvent(status: false)),
      onDetach: () => homeBloc.add(UpdateUserStatusEvent(status: false)),
    );

    homeBloc
      ..add(GetContactsEvent())
      ..add(UpdateUserStatusEvent(status: true));

    FirebaseMessaging.onMessage
        .listen(getIt<NotificationsSetup>().showNotification);

    super.initState();
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userState = context.read<AuthBloc>().state;
    final user = userState is AuthStateLoggedIn ? userState.user : null;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChatAvatar(
                    name: user?.displayName ?? '',
                    urlImage: user?.photoURL,
                  ),
                  Text(
                    'Home',
                    style: textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () => homeBloc.add(LogOutEvent()),
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
            ),
            const Chats(),
          ],
        ),
      ),
    );
  }
}
