import 'package:chat_app_flutter_ec/data/contacts/domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Stream<List<Contact>> getContacts() {
    return _firebaseDatabase.ref('contacts').onValue.map((databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        return (databaseEvent.snapshot.value as Map).map((key, value) {
          final newMap = value as Map;
          newMap['id'] = key;
          return MapEntry(key, value);
        });
      }
      return {};
    }).map((data) => Contact.fromJsonArray(data.values.toList()));
  }

  @override
  Future<void> updateUserStatus(
    User user,
    bool status, {
    String? token,
  }) {
    return _firebaseDatabase.ref('contacts').child(user.uid).update({
      'name': user.displayName,
      'photoUrl': user.photoURL,
      'status': status,
      'token': token,
    });
  }
}
