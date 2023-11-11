import 'package:contacts_app/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/company.dart';
import '../../data/model/person.dart';
import '../../data/model/user.dart';
import '../../data/services/user_repository.dart';
import '../login/login_page.dart';
import 'type_controller.dart';

class Register extends StatelessWidget {
  final nicknameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final typeController = Get.put(TypeController());
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: form(),
          ),
        ),
      ),
    ));
  }

  List<Widget> form() {
    return [
      const Text('I\'m a...'),
      Obx(() => Text(typeController.type.value)),
      Obx(() => CircleAvatar(
            radius: 30,
            backgroundColor: typeController.type.value == 'Person'
                ? Colors.orangeAccent
                : Colors.blue,
            foregroundColor: Colors.white,
            child: Icon(typeController.type.value == 'Person'
                ? Icons.person
                : Icons.business),
          )),
      Obx(() => Switch(
            value: typeController.type.value == 'Person',
            onChanged: (value) {
              typeController.toogleType();
            },
            activeColor: Colors.orange, //bolita
            activeTrackColor: Colors.orangeAccent, //cuerpo
            inactiveThumbColor: Colors.blue, //bolita
            inactiveTrackColor: Colors.blueAccent, //cuerpo
          )),
      TextFormField(
        controller: nicknameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: 'Nickname',
        ),
      ),
      Obx(
        () => TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: typeController.type.value == 'Person'
                ? 'First Name'
                : 'Company Name',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
      ),
      TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
          ),
        ),
      ),
      Obx(
        () => ElevatedButton(
          onPressed: () {
            var possibleUser = User(
                nickname: nicknameController.text,
                password: passwordController.text);
            possibleUser.email = emailController.text;
            if (passwordController.text != confirmPasswordController.text) {
              Get.dialog(AlertDialog(
                title: const Text('Error'),
                content: const Text('Passwords don\'t match'),
                actions: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text('Ok'))
                ],
              ));
            } else if (UserRepository.existsEmail(possibleUser) ||
                UserRepository.existsNickname(possibleUser)) {
              Get.dialog(AlertDialog(
                title: const Text('Error'),
                content: const Text('User or Email already exists'),
                actions: [
                  TextButton(
                      onPressed: () => Get.back(), child: const Text('Ok'))
                ],
              ));
            } else {
              Get.showSnackbar(GetSnackBar(
                  title: 'Success',
                  message: 'Welcome ${possibleUser.nickname}',
                  duration: const Duration(seconds: 2)));
              possibleUser.contact = typeController.type.value == 'Person'
                  ? Person(nameController.text)
                  : Company(nameController.text);
              UserRepository.users.add(possibleUser);
              UserRepository.setCurrentUser(possibleUser);
              Get.offAll(Home());
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: typeController.type.value == 'Person'
                ? Colors.orangeAccent
                : Colors.blue,
          ),
          child: const Text('Login'),
        ),
      ),
      const Text('Already have an account?'),
      Obx(
        () => TextButton(
          onPressed: () => Get.to(Login()),
          style: TextButton.styleFrom(
            foregroundColor: typeController.type.value == 'Person'
                ? Colors.orangeAccent
                : Colors.blue,
          ),
          child: const Text('Go to Login'),
        ),
      ),
    ];
  }
}
