import 'package:get/get.dart';

class InputDataController extends GetxController {
  RxString nama = RxString("");
  RxString alamat = RxString("");
  RxString nohp = RxString("");

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
