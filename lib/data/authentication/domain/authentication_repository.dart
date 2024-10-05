import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Stream<User?> get user;

  Future<User?> get currentUser;

  Future<void> logOut();

  Future<void> signInWithGoogle();
}
