import 'package:contacts_app/app/data/services/user_repository.dart';
import 'package:contacts_app/app/global_widgets/user_icon.dart';
import 'package:contacts_app/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppBar {
  static AppBar buildAppBar(String title, {List<Widget>? actions}) {
    print(UserRepository.currentType);
    actions!.add(IconButton(
        onPressed: () {
          Get.offAll(Login());
          UserRepository.loggedUser = null;
        },
        icon: const Icon(Icons.logout)));
    return AppBar(
      backgroundColor:
          UserRepository.currentType == 'Person' ? Colors.orange : Colors.blue,
      title: Text(title),
      actions: actions,
      leading: const UserIcon(),
    );
  }
}
