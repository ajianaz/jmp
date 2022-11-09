import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:juniormobileprogrammer/app/core/values/strings.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';

class InputDataController extends GetxController {
  RxString nama = RxString("");
  RxString alamat = RxString("");
  RxString nohp = RxString("");
  RxDouble latitude = RxDouble(0.0);
  RxDouble longitude = RxDouble(0.0);
  RxString location = RxString("Menunggu load GPS");
  RxString imagepath = RxString("");

  final ImagePicker iPicker = ImagePicker();
  XFile? image;

  getPathXFile() {
    return image?.path;
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
    UserModel addUser = new UserModel(
        name: nama.value,
        address: alamat.value,
        phoneNumber: nohp.value,
        path: imagepath.value,
        latitude: latitude.value,
        longitude: longitude.value);
    var box = await Hive.openBox<UserModel>(appName);

    box.add(addUser);

    resetInput();
  }

  isDataValid() {
    if (nama.value.isNotEmpty &&
        alamat.value.isNotEmpty &&
        nohp.value.isNotEmpty &&
        imagepath.value.isNotEmpty &&
        latitude.value != 0.0 &&
        longitude.value != 0.0) {
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
