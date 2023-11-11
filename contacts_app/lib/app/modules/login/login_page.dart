import 'package:contacts_app/app/data/services/user_repository.dart';
import 'package:contacts_app/app/modules/register/register_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/model/user.dart';
import '../home/home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final nicknameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: form(),
        ),
      ),
    ));
  }

  List<Widget> form() {
    return [
      TextFormField(
        controller: nicknameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: 'Nickname',
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          var possibleUser = User(
              nickname: nicknameController.text,
              password: passwordController.text);
          if (UserRepository.users.contains(possibleUser)) {
            Get.showSnackbar(GetSnackBar(
                title: 'Success',
                message: 'Welcome ${possibleUser.nickname}',
                duration: const Duration(seconds: 2)));
            UserRepository.setCurrentUser(possibleUser);
            Get.offAll(Home());
          } else {
            Get.dialog(AlertDialog(
              title: const Text('Error'),
              content: const Text('Not coincidences found'),
              actions: [
                TextButton(onPressed: () => Get.back(), child: const Text('Ok'))
              ],
            ));
          }
        },
        child: const Text('Login'),
      ),
      const Text('or'),
      TextButton(
        onPressed: () => Get.to(Register()),
        child: const Text('Register'),
      ),
    ];
  }
}
