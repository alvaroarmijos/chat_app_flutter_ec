part of 'chat_bloc.dart';

sealed class ChatEvent {}

class GetMessagesEvent extends ChatEvent {
  final String userId;
  final String contactId;

  GetMessagesEvent(this.userId, this.contactId);
}

class SendMessageEvent extends ChatEvent {
  final String message;
  final String contactId;
  final String userId;

  SendMessageEvent(this.message, this.contactId, this.userId);
}
