import 'package:get/get.dart';

class TypeController extends GetxController {
  TypeController();

  final type = 'Person'.obs;
  void toogleType() {
    type.value = type.value == 'Person' ? 'Company' : 'Person';
  }
}
