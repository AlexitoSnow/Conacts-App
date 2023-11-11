import 'package:contacts_app/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserConfig extends StatelessWidget {
  const UserConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Config'),
        automaticallyImplyLeading: false,
      ),
      body: OutlinedButton(
          onPressed: () => Get.to(Home()), child: const Text('Home')),
    );
  }
}
