import 'package:chat_app_flutter_ec/app/home/bloc/home_bloc.dart';
import 'package:chat_app_flutter_ec/app/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                bottom: 20,
              ),
              child: Text(
                'Contacts',
                style: textTheme.labelLarge,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.contacts.length,
                    itemBuilder: (context, index) => ChatItem(
                      contact: state.contacts[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
