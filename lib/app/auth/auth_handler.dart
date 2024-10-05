import 'package:chat_app_flutter_ec/app/app.dart';
import 'package:chat_app_flutter_ec/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(CheckUserEvent());
    });

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous is AuthStateLoading && (current is AuthStateLoggedIn) ||
              (current is AuthStateLoggedOut)) ||
          (previous is AuthStateLoggedOut && current is AuthStateLoggedIn) ||
          (previous is AuthStateLoggedIn && current is AuthStateLoggedOut),
      listener: (context, state) {
        if (state is AuthStateLoggedIn) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
            AppNavigator.ROUTE_HOME,
            (route) => false,
          );
        } else if (state is AuthStateLoggedOut) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
            AppNavigator.ROUTE_ONBOARDING,
            (route) => false,
          );
        }
      },
      child: child,
    );
  }
}
