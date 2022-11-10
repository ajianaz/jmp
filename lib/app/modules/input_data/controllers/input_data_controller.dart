import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:juniormobileprogrammer/app/core/values/strings.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';

class InputDataController extends GetxController {
  late var argument;
  UserModel? user = null;

  RxString nama = RxString("");
  RxString alamat = RxString("");
  RxString nohp = RxString("");
  RxDouble latitude = RxDouble(0.0);
  RxDouble longitude = RxDouble(0.0);
  RxString location = RxString("");
  RxString imagepath = RxString("");
  RxString gender = RxString("PRIA");

  RxInt index = RxInt(0);

  final ImagePicker iPicker = ImagePicker();
  XFile? image;

  getPathXFile() {
    return image?.path;
  }

  loadUser() {
    user = argument[1]['user'];
    index.value = argument[0]['position'];
    update();

    nama.value = user!.name.toString();
    alamat.value = user!.address.toString();
    nohp.value = user!.phoneNumber.toString();
    imagepath.value = user!.path.toString();
    latitude.value = user!.latitude!;
    longitude.value = user!.longitude!;
    location.value = '${user!.latitude}, ${user!.longitude}';
    gender.value = user!.gender.toString();
  }

  //getLongLAT
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  saveUserData() async {
    if (index.value == 0 && (user == null || user.isBlank!)) {
      UserModel addUser = new UserModel(
          name: nama.value,
          address: alamat.value,
          phoneNumber: nohp.value,
          path: imagepath.value,
          latitude: latitude.value,
          longitude: longitude.value,
          gender: gender.value);
      var box = await Hive.openBox<UserModel>(appName);

      box.add(addUser);

      resetInput();
    } else {
      UserModel updateUser = new UserModel(
          name: nama.value,
          address: alamat.value,
          phoneNumber: nohp.value,
          path: imagepath.value,
          latitude: latitude.value,
          longitude: longitude.value,
          gender: gender.value);
      var box = await Hive.openBox<UserModel>(appName);
      box.putAt(index.value, updateUser);
    }
  }

  isDataValid() {
    if (nama.value.isNotEmpty &&
        alamat.value.isNotEmpty &&
        nohp.value.isNotEmpty &&
        imagepath.value.isNotEmpty &&
        latitude.value != 0.0 &&
        longitude.value != 0.0 &&
        gender.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  resetInput() {
    nama.value = "";
    alamat.value = "";
    nohp.value = "";
    imagepath.value = "";
    latitude.value = 0.0;
    longitude.value = 0.0;
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
