import 'package:hive/hive.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';

import '../../values/strings.dart';

class HiveHelper {
  //Hive String
  static const HIVE_USER = "user";

  static final _hive = Hive.box(appName);

  static getData(String key, {dynamic defaultvalue}) {
    return _hive.get(key, defaultValue: defaultvalue);
  }

  static putData(String key, dynamic data) {
    return _hive.put(key, data);
  }

  static deleteData(String keyName) {
    return _hive.delete(keyName);
  }

  static bool checkKey(dynamic key) {
    bool check = _hive.containsKey(key);
    return check;
  }

  addUser(UserModel item) async {
    UserModel addUser = new UserModel(
        name: item.name,
        address: item.address,
        phoneNumber: item.phoneNumber,
        path: item.path,
        latitude: item.latitude,
        longitude: item.longitude);
    var box = await Hive.openBox<UserModel>(appName);

    box.add(addUser);
  }

  Future<List<UserModel>> getUsers() async {
    final box = await Hive.openBox<UserModel>(appName);
    return box.values.toList();
  }

  updateUser(int index, UserModel item) async {
    UserModel updateUser = new UserModel(
        name: item.name,
        address: item.address,
        phoneNumber: item.phoneNumber,
        path: item.path,
        latitude: item.latitude,
        longitude: item.longitude);
    var box = await Hive.openBox<UserModel>(appName);
    box.putAt(index, updateUser);
  }

  deleteUser(int id) async {
    final box = Hive.box<UserModel>(appName);
    box.deleteAt(id);
  }
}
