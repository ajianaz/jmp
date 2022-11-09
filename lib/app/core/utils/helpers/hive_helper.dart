import 'package:hive/hive.dart';

import '../../values/strings.dart';

class HiveHelper {
  //Hive String
  static const HIVE_USER = "user";

  static const HIVE_ID = "id";
  static const HIVE_NAME = 'name';
  static const HIVE_EMAIL = 'email';
  static const HIVE_NOMOR_WA = 'nomor_wa';
  static const HIVE_ROLE_ID = 'role_id';
  static const HIVE_SUSPEND = 'suspended';
  static const HIVE_FCM_TOKEN = 'fcmToken';
  static const HIVE_TOKEN = 'token';
  static const HIVE_USER_APIKEY = 'apiKey';
  static const HIVE_IS_LOGGED_IN = 'isLoggedIn';

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

  static dynamic getUser() {
    dynamic user;
    user.id = getData(HIVE_ID);
    user.email = getData(HIVE_EMAIL);
    user.name = getData(HIVE_NAME);
    user.nomor_wa = getData(HIVE_NOMOR_WA);
    user.suspend = getData(HIVE_SUSPEND);

    return user;
  }

  static saveUser(dynamic user) {
    putData(HIVE_ID, user?.id);
    putData(HIVE_NAME, user?.name);
    putData(HIVE_EMAIL, user?.email);
    putData(HIVE_ROLE_ID, user?.role_id);
    putData(HIVE_SUSPEND, user?.suspend);
    putData(HIVE_TOKEN, user?.token);
  }

  static logoutUser() {
    putData(HIVE_IS_LOGGED_IN, false);
    putData(HIVE_ID, null);
    putData(HIVE_NAME, null);
    putData(HIVE_EMAIL, null);
    putData(HIVE_ROLE_ID, null);
    putData(HIVE_SUSPEND, null);
    putData(HIVE_TOKEN, null);
  }
}
