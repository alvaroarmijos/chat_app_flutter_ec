import 'package:chat_app_flutter_ec/app/auth/bloc/auth_bloc.dart';
import 'package:chat_app_flutter_ec/app/chat/chat.dart';
import 'package:chat_app_flutter_ec/app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextFormField extends StatefulWidget {
  const ChatTextFormField({
    super.key,
    required this.contactId,
  });

  final String contactId;

  @override
  State<ChatTextFormField> createState() => _ChatTextFormFieldState();
}

class _ChatTextFormFieldState extends State<ChatTextFormField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12).copyWith(
            bottom: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: AppColors.greyForm,
                    hintText: 'Write your message',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGrey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.small(
                onPressed: () {
                  final message = _controller.text.trim();
                  final authState = context.read<AuthBloc>().state;
                  if (message.isNotEmpty && authState is AuthStateLoggedIn) {
                    final chatCubit = context.read<ChatBloc>();
                    chatCubit.add(SendMessageEvent(
                      message,
                      widget.contactId,
                      authState.user.uid,
                    ));
                    _controller.clear();
                  }
                },
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
