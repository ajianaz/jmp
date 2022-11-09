import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:juniormobileprogrammer/app/core/values/colors.dart';
import 'package:juniormobileprogrammer/app/core/values/dimens.dart';
import 'package:juniormobileprogrammer/app/core/values/style.dart';
import 'package:juniormobileprogrammer/app/global_widget/button/outline_button_custom.dart';

import '../../../global_widget/button/elevated_button_custom.dart';
import '../../../global_widget/text_field.dart';
import '../controllers/input_data_controller.dart';

class InputDataView extends GetView<InputDataController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Input Data User'),
          centerTitle: true,
          actions: [
            Container(
              padding: EdgeInsets.only(right: defaultPadding),
              child: InkWell(
                child: Icon(Icons.save),
                onTap: () {
                  if (controller.isDataValid()) {
                    //todo simpan
                    controller.saveUserData();
                    Get.defaultDialog(
                        title: "Perhatian",
                        middleText: "Berhasil menyimpan data");
                  } else {
                    Get.defaultDialog(
                        title: "Perhatian",
                        middleText: "Silahkan lengkapi data dahulu");
                  }
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            child: Column(
              children: [
                buildTextField(
                  "Nama",
                  "Anaz S. Aji",
                  controller.nama,
                  TextInputType.text,
                  icon: Icons.person,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                buildTextField(
                  "Alamat",
                  "Semarang",
                  controller.alamat,
                  TextInputType.text,
                  icon: Icons.home,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                buildTextField(
                  "No. Handphone",
                  "085727xxx",
                  controller.nohp,
                  TextInputType.phone,
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  controller.location.value,
                  style: kLabelStyle.copyWith(color: blackColor),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                ElevatedButtonCustom(
                  text: "GetLocation",
                  callback: () async {
                    Position position =
                        await controller.getGeoLocationPosition();
                    controller.latitude.value = position.latitude;
                    controller.longitude.value = position.longitude;
                    controller.location.value =
                        '${position.latitude}, ${position.longitude}';
                  },
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                ElevatedButtonCustom(
                  text: "Get Image",
                  callback: () {
                    Get.defaultDialog(
                      title: "Pilih Sumber",
                      content: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButtonCustom(
                              text: "Kamera",
                              callback: () async {
                                controller.image = await controller.iPicker
                                    .pickImage(source: ImageSource.camera);
                                print(controller.image!.path);
                                Get.back();
                                if (controller.image != null)
                                  controller.imagepath.value =
                                      controller.image!.path;
                              },
                            ),
                            SizedBox(
                              width: defaultPadding,
                            ),
                            OutlineButtonCustom(
                              text: "Gallery",
                              callback: () async {
                                controller.image = await controller.iPicker
                                    .pickImage(source: ImageSource.gallery);
                                Get.back();
                                if (controller.image != null)
                                  controller.imagepath.value =
                                      controller.image!.path;
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                controller.imagepath.value != ""
                    ? Image.file(
                        File(controller.image!.path),
                        fit: BoxFit.cover,
                        height: 200,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
