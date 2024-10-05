import 'package:chat_app_flutter_ec/app/chat/widgets/widgets.dart';
import 'package:chat_app_flutter_ec/data/contacts/domain/domain.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: ChatAppBarTitle(
          contact: contact,
        ),
      ),
      body: Stack(
        children: [
          Messages(
            contact: contact,
          ),
          ChatTextFormField(
            contactId: contact.id,
          ),
        ],
      ),
    );
  }
}
