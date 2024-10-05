import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_flutter_ec/data/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authenticationRepository) : super(AuthStateLoading()) {
    on<CheckUserEvent>(_onCheckUserEvent);
  }

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> _onCheckUserEvent(
      CheckUserEvent event, Emitter<AuthState> emit) {
    return emit.forEach(_authenticationRepository.user, onData: (user) {
      if (user != null) {
        return AuthStateLoggedIn(user: user);
      } else {
        return AuthStateLoggedOut();
      }
    });
  }
}
