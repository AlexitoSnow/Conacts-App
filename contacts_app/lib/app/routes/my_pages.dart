library my_pages;

import 'package:contacts_app/app/modules/home/home_page.dart';
import 'package:contacts_app/app/modules/register/register_page.dart';
import 'package:get/get.dart';

import '../modules/login/login_page.dart';
part 'my_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
    ),
    //Añadir todos los restantes
    GetPage(
      name: Routes.REGISTER,
      page: () => Register(),
    ),
  ];
}
