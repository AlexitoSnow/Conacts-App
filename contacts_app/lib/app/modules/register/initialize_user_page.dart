/*import 'package:flutter/material.dart';

import '../../data/model/user.dart';

class InitiliazeUser extends StatelessWidget {
  final User user;
  const InitiliazeUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('I\'m a...'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Person',
              ),
              Tab(
                text: 'Company',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            personForm(),
          ],
        ),
      ),
    );
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
          controller: nicknameController,
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
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
          ),
        ),
      ),
      ElevatedButton(
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
                TextButton(onPressed: () => Get.back(), child: const Text('Ok'))
              ],
            ));
          } else if (UserRepository.existsEmail(possibleUser) ||
              UserRepository.existsNickname(possibleUser)) {
            Get.dialog(AlertDialog(
              title: const Text('Error'),
              content: const Text('User or Email already exists'),
              actions: [
                TextButton(onPressed: () => Get.back(), child: const Text('Ok'))
              ],
            ));
          } else {
            Get.showSnackbar(GetSnackBar(
                title: 'Success',
                message: 'Welcome ${possibleUser.nickname}',
                duration: const Duration(seconds: 2)));
            Get.offAll(InitiliazeUser(user: possibleUser));
          }
        },
        child: const Text('Continue'),
      ),
      const Text('Already have an account?'),
      TextButton(
        onPressed: () => Get.to(Login()),
        child: const Text('Go to Login'),
      ),
    ];
  }

  Form personForm() {
    return Form(
      child: Column(
        children: [
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
              controller: nicknameController,
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
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
          ),
          ElevatedButton(
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
                Get.offAll(InitiliazeUser(user: possibleUser));
              }
            },
            child: const Text('Continue'),
          ),
          const Text('Already have an account?'),
          TextButton(
            onPressed: () => Get.to(Login()),
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }

  Form companyForm() {
    return Form(
      child: Column(
        children: [
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
              controller: nicknameController,
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
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
          ),
          ElevatedButton(
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
                Get.offAll(InitiliazeUser(user: possibleUser));
              }
            },
            child: const Text('Continue'),
          ),
          const Text('Already have an account?'),
          TextButton(
            onPressed: () => Get.to(Login()),
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
*/