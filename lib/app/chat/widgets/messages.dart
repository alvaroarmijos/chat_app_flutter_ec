import 'package:chat_app_flutter_ec/app/auth/auth.dart';
import 'package:chat_app_flutter_ec/app/chat/chat.dart';
import 'package:chat_app_flutter_ec/data/contacts/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messages extends StatefulWidget {
  const Messages({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthStateLoggedIn) {
      context.read<ChatBloc>().add(GetMessagesEvent(
            authState.user.uid,
            widget.contact.id,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 100,
            duration: Durations.medium1,
            curve: Curves.fastOutSlowIn,
          );
        });
      },
      builder: (context, state) {
        final messages = state.messages;

        return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              bottom: 100,
            ),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return MessageItem(
                userName: widget.contact.name,
                photoUrl: widget.contact.photoUrl,
                msg: messages[index].message ?? '',
                date: messages[index].messageDate!,
                mySelf: widget.contact.id != messages[index].sentBy,
              );
            });
      },
    );
  }
}
