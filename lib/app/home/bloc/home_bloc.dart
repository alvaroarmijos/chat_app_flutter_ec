import 'dart:async';

import 'package:chat_app_flutter_ec/data/authentication/authentication.dart';
import 'package:chat_app_flutter_ec/data/contacts/contacts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._contactsRepository,
    this._authenticationRepository,
  ) : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  final ContactsRepository _contactsRepository;
  final AuthenticationRepository _authenticationRepository;
  final _firebaseMessaging = FirebaseMessaging.instance;

  FutureOr<void> _onGetContactsEvent(
      GetContactsEvent event, Emitter<HomeState> emit) async {
    final user = await _authenticationRepository.currentUser;

    return emit.forEach(
      _contactsRepository.getContacts(),
      onData: (data) {
        data.removeWhere(
          (contact) => contact.id == user?.uid,
        );
        return HomeState(
          contacts: data,
        );
      },
    );
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authenticationRepository.currentUser;
    final token = await _firebaseMessaging.getToken();
    if (user != null) {
      await _contactsRepository.updateUserStatus(user, event.status,
          token: token);
    }
  }

  FutureOr<void> _onLogOutEvent(
      LogOutEvent event, Emitter<HomeState> emit) async {
    final user = await _authenticationRepository.currentUser;

    await _authenticationRepository.logOut();
    if (user != null) {
      await _contactsRepository.updateUserStatus(
        user,
        false,
      );
    }
  }
}
