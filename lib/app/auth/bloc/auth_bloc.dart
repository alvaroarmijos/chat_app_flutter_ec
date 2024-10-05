import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_flutter_ec/data/authentication/infrastructure/authentication_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateLoading()) {
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  final authenticationRepository = AuthenticationRepositoryImpl();

  FutureOr<void> _onCheckUserEvent(
      CheckUserEvent event, Emitter<AuthState> emit) {
    return emit.forEach(authenticationRepository.user, onData: (user) {
      if (user != null) {
        return AuthStateLoggedIn(user: user);
      } else {
        return AuthStateLoggedOut();
      }
    });
  }
}
