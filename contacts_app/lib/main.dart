import 'app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/my_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LOGIN,
    defaultTransition: Transition.leftToRight,
    getPages: AppPages.pages,
    home: Login(),
  ));
}
