import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_flutter_ec/app/di/di.dart';
import 'package:chat_app_flutter_ec/data/chat/domain/domain.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<GetMessagesEvent>(_onGetMessagesEvent);
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  final ChatRepository _chatRepository = getIt<ChatRepository>();

  FutureOr<void> _onGetMessagesEvent(
      GetMessagesEvent event, Emitter<ChatState> emit) {
    return emit.forEach(
      _chatRepository.getChats(_generateChatId(
        event.userId,
        event.contactId,
      )),
      onData: (messages) {
        return state.copyWith(messages: messages);
      },
    );
  }

  FutureOr<void> _onSendMessageEvent(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    final date = DateTime.now().toIso8601String();

    await _chatRepository.sendMessage(
      _generateChatId(
        event.userId,
        event.contactId,
      ),
      event.message,
      date,
      event.userId,
      event.contactId,
    );
  }

  String _generateChatId(String userId, String contactId) {
    final ids = [userId, contactId];
    ids.sort();
    return '${ids[0]}_${ids[1]}';
  }
}
