import 'package:chat_app_flutter_ec/data/authentication/authentication.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );

  // getIt.registerSingleton<ChatRepository>(ChatRepositoryImpl());

  // getIt.registerSingleton<MessagesRepository>(MessagesRepositoryImpl());

  // getIt.registerSingleton(NotificationsSetup());
}
