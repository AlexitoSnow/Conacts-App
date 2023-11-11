import 'package:contacts_app/app/data/model/company.dart';
import 'package:contacts_app/app/data/services/user_repository.dart';
import 'package:contacts_app/app/global_widgets/app_bar.dart';
import 'package:contacts_app/app/modules/create_contact/create_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/contact.dart';
import '../../data/model/person.dart';
import '../../data/model/user.dart';
import '../contact_info/contact_info_page.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final User? user = UserRepository.loggedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            UserAppBar.buildAppBar('Welcome back, ${user!.nickname}', actions: [
          IconButton(
              onPressed: () => Get.to(const CreateContact()),
              icon: const Icon(Icons.add))
        ]),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: user!.contact?.contacts.length,
                itemBuilder: (context, index) {
                  var contact = user!.contact?.contacts[index];
                  if (contact is Person) {
                    return personContact(contact);
                  } else if (contact is Company) {
                    return companyContact(contact);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ));
  }

  ListTile personContact(Contact c) {
    Person contact = c as Person;
    return ListTile(
      leading: const CircleAvatar(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.person,
          )),
      title: Text(contact.firstName),
      subtitle: Text(contact.phones.values.firstOrNull ?? ''),
      onTap: () => Get.to(ContactInfo(contact: contact)),
    );
  }

  ListTile companyContact(Contact c) {
    Company contact = c as Company;
    return ListTile(
      leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Icon(Icons.business)),
      title: Text(contact.companyName),
      subtitle: Text(contact.phones.values.firstOrNull ?? ''),
      onTap: () => Get.to(ContactInfo(contact: contact)),
    );
  }
}
