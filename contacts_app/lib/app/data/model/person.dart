import 'package:contacts_app/app/data/model/address.dart';

import 'contact.dart';

class Person extends Contact {
  String firstName;
  String? middleName;
  String? lastName;
  String? secondLastName;
  DateTime? birthday;
  Map<String, DateTime>? dates;

  Person(this.firstName,
      {this.middleName,
      this.lastName,
      this.secondLastName,
      this.birthday,
      this.dates,
      Address? address,
      String? photo})
      : super(address: address, photo: photo);

  void addDate(String type, DateTime date) {
    dates![type] = date;
  }
}
