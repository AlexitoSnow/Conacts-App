import 'package:contacts_app/app/data/services/user_repository.dart';
import 'package:contacts_app/app/modules/user_config/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const UserConfig()),
      child: CircleAvatar(
        backgroundColor: UserRepository.currentType == 'Person'
            ? Colors.orangeAccent
            : Colors.blueAccent,
        child: const Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
    );
  }
}
