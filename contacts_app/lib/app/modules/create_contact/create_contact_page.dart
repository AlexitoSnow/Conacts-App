import 'dart:math';

import 'package:contacts_app/app/data/model/person.dart';
import 'package:contacts_app/app/data/services/user_repository.dart';
import 'package:contacts_app/app/global_widgets/app_bar.dart';
import 'package:contacts_app/app/modules/home/home_page.dart';
import '../../data/enums/type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/company.dart';

class CreateContact extends StatelessWidget {
  const CreateContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar('Creating Contact'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  var random = Random();
                  var number = random.nextInt(999999999);
                  var type = ['Person', 'Company'][random.nextInt(2)];
                  var contact = type == 'Person'
                      ? Person('Jane', middleName: 'Anne', lastName: 'Doe')
                      : Company('John Doe Company');
                  contact.addPhone(
                      Type.work.name.toUpperCase(), '0${number.toString()}');
                  UserRepository.loggedUser?.contact?.addContact(contact);
                  Get.off(Home());
                },
                child: const Text('Add Contact'))
          ],
        ),
      ),
    );
  }
}
