import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  final String id;
  final String name;
  final String? photoUrl;
  final bool status;

  Contact({
    required this.id,
    required this.name,
    this.photoUrl,
    required this.status,
  });

  factory Contact.fromJson(Map json) => Contact(
        name: json["name"] ?? '',
        id: json["id"],
        photoUrl: json["photoUrl"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "photoUrl": photoUrl,
        "status": status,
      };

  static List<Contact> fromJsonArray(List jsonArray) {
    return jsonArray.map((e) => Contact.fromJson(e)).toList();
  }
}
