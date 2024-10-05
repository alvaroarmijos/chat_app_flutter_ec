part of 'chat_bloc.dart';

class ChatState {
  ChatState({
    this.messages = const [],
  });

  final List<Message> messages;

  ChatState copyWith({List<Message>? messages}) {
    return ChatState(messages: messages ?? this.messages);
  }
}
