import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:chat_app_flutter_ec/app/widgets/widgets.dart';
import 'package:chat_app_flutter_ec/data/contacts/domain/domain.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // AppNavigator.navigateToChat(context, contact);
      },
      leading: ChatAvatar(
        name: contact.name,
        urlImage: contact.photoUrl,
      ),
      title: Text(
        contact.name,
      ),
      subtitle: Text(
        contact.status ? 'Online' : 'Offline',
        style: TextStyle(
          color: AppColors.darkGrey,
        ),
      ),
      trailing: SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: contact.status ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
