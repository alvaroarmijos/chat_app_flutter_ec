import 'package:chat_app_flutter_ec/app/di/di.dart';
import 'package:chat_app_flutter_ec/app/onboarding/cubit/onboarding_cubit.dart';
import 'package:chat_app_flutter_ec/app/onboarding/page/onboarding_page.dart';
import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:chat_app_flutter_ec/data/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => AuthBloc(),
    //   child: AuthHandler(
    //     child: MaterialApp(
    //       theme: AppTheme.light,
    //       title: 'Material App',
    //       navigatorKey: navigatorKey,
    //       routes: {
    //         AppNavigator.ROUTE_MAIN_PAGE: (context) => const MainPage(),
    //         AppNavigator.ROUTE_ONBOARDING: (context) => BlocProvider(
    //               create: (context) => OnboardingCubit(
    //                 getIt<AuthenticationRepository>(),
    //               ),
    //               child: const OnboardingPage(),
    //             ),
    //         // AppNavigator.ROUTE_HOME: (context) => BlocProvider(
    //         //       create: (context) => HomeBloc(
    //         //         getIt<ChatRepository>(),
    //         //         getIt<AuthenticationRepository>(),
    //         //       ),
    //         //       child: const HomePage(),
    //         //     ),
    //         // AppNavigator.ROUTE_CHAT: (context) => BlocProvider(
    //         //       create: (context) => ChatCubit(
    //         //         getIt<MessagesRepository>(),
    //         //       ),
    //         //       child: const ChatPage(),
    //         //     ),
    //       },
    //     ),
    //   ),
    // );

    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      navigatorKey: navigatorKey,
      routes: {
        // AppNavigator.ROUTE_MAIN_PAGE: (context) => const MainPage(),
        AppNavigator.ROUTE_MAIN_PAGE: (context) => BlocProvider(
              create: (context) => OnboardingCubit(
                getIt<AuthenticationRepository>(),
              ),
              child: const OnboardingPage(),
            ),
        // AppNavigator.ROUTE_HOME: (context) => BlocProvider(
        //       create: (context) => HomeBloc(
        //         getIt<ChatRepository>(),
        //         getIt<AuthenticationRepository>(),
        //       ),
        //       child: const HomePage(),
        //     ),
        // AppNavigator.ROUTE_CHAT: (context) => BlocProvider(
        //       create: (context) => ChatCubit(
        //         getIt<MessagesRepository>(),
        //       ),
        //       child: const ChatPage(),
        //     ),
      },
    );
  }
}
