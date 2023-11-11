import 'package:contacts_app/app/data/model/address.dart';

import 'contact.dart';

class Company extends Contact {
  String companyName;

  Company(this.companyName, {String? photo, Address? address})
      : super(address: address, photo: photo);
}
