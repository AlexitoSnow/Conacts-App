import 'address.dart';

abstract class Contact {
  Address? address;
  Map<String, String> emails = {};
  Map<String, String> phones = {};
  List<Contact> contacts = [];
  String? photo;

  Contact({this.address, this.photo});

  void addEmail(String type, String email) {
    emails.addEntries([MapEntry(type, email)]);
  }

  void addPhone(String type, String phone) {
    phones.addEntries([MapEntry(type, phone)]);
  }

  void addContact(Contact contact) {
    contacts.add(contact);
  }
}
