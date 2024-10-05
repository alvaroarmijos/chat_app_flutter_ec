import 'package:chat_app_flutter_ec/data/contacts/domain/domain.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_HOME = '/home';
  static const ROUTE_ONBOARDING = '/onboarding';
  static const ROUTE_CHAT = '/chat';

  static void navigateToChat(BuildContext context, Contact contact) {
    Navigator.pushNamed(
      context,
      AppNavigator.ROUTE_CHAT,
      arguments: contact,
    );
  }
}
