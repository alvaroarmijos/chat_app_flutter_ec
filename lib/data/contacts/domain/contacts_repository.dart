import 'package:chat_app_flutter_ec/data/contacts/domain/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ContactsRepository {
  Stream<List<Contact>> getContacts();

  Future<void> updateUserStatus(
    User user,
    bool status, {
    String? token,
  });
}
