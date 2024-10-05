import 'package:chat_app_flutter_ec/app/auth/auth_handler.dart';
import 'package:chat_app_flutter_ec/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_flutter_ec/app/chat/chat.dart';
import 'package:chat_app_flutter_ec/app/di/di.dart';
import 'package:chat_app_flutter_ec/app/home/home.dart';
import 'package:chat_app_flutter_ec/app/onboarding/cubit/onboarding_cubit.dart';
import 'package:chat_app_flutter_ec/app/onboarding/page/onboarding_page.dart';
import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:chat_app_flutter_ec/app/widgets/main_page.dart';
import 'package:chat_app_flutter_ec/data/authentication/authentication.dart';
import 'package:chat_app_flutter_ec/data/contacts/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        getIt<AuthenticationRepository>(),
      ),
      child: AuthHandler(
        child: MaterialApp(
          theme: AppTheme.light,
          title: 'Material App',
          navigatorKey: navigatorKey,
          routes: {
            AppNavigator.ROUTE_MAIN_PAGE: (context) => const MainPage(),
            AppNavigator.ROUTE_ONBOARDING: (context) => BlocProvider(
                  create: (context) => OnboardingCubit(
                    getIt<AuthenticationRepository>(),
                  ),
                  child: const OnboardingPage(),
                ),
            AppNavigator.ROUTE_HOME: (context) => BlocProvider(
                  create: (context) => HomeBloc(
                    getIt<ContactsRepository>(),
                    getIt<AuthenticationRepository>(),
                  ),
                  child: const HomePage(),
                ),
            AppNavigator.ROUTE_CHAT: (context) => BlocProvider(
                  create: (context) => ChatBloc(),
                  child: const ChatPage(),
                ),
          },
        ),
      ),
    );
  }
}
