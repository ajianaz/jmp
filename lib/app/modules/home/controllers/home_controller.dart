import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:juniormobileprogrammer/app/core/values/strings.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';

class HomeController extends GetxController {
  List<UserModel> listUser = <UserModel>[].obs;

  UserModel user = UserModel().obs();

  RxString nama = RxString("");
  RxString alamat = RxString("");
  RxString nohp = RxString("");

  loadUser(UserModel user) {
    nama.value = user.name.toString();
    alamat.value = user.address.toString();
    nohp.value = user.phoneNumber.toString();
  }

  pushUser() {}

  Future<void> getUsers() async {
    listUser.clear();
    final box = await Hive.openBox<UserModel>(appName);
    listUser.addAll(box.values.toList());
    update();
    refresh();
  }

  delete(pos) {
    final box = Hive.box<UserModel>(appName);
    box.deleteAt(pos);
    listUser.removeAt(pos);
    update();
  }

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
}
