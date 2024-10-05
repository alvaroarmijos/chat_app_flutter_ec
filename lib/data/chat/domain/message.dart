// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  final String? message;
  final DateTime? messageDate;
  final String? sentBy;
  final String? sentTo;

  Message({
    this.message,
    this.messageDate,
    this.sentBy,
    this.sentTo,
  });

  factory Message.fromJson(Map json) => Message(
        message: json["message"],
        messageDate: json["messageDate"] == null
            ? null
            : DateTime.parse(json["messageDate"]),
        sentBy: json["sentBy"],
        sentTo: json["sentTo"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messageDate": messageDate?.toIso8601String(),
        "sentBy": sentBy,
        "sentTo": sentTo,
      };

  static List<Message> fromJsonArray(List objects) {
    return objects.map((object) => Message.fromJson(object)).toList()
      ..sort((a, b) => a.messageDate!.compareTo(b.messageDate!));
  }
}
