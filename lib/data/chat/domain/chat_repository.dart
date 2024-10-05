import 'package:chat_app_flutter_ec/data/chat/domain/message.dart';

abstract class ChatRepository {
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
    String sentTo,
  );

  Stream<List<Message>> getChats(String chatId);
}
