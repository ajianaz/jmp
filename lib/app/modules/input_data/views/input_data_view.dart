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
    controller.argument = Get.arguments;
    // print(controller.argument[1]);
    if (controller.argument != null) {
      controller.loadUser();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(controller.argument == null
              ? 'Input Data User'
              : "Update Data User"),
          centerTitle: true,
          actions: [
            Container(
              padding: EdgeInsets.only(right: defaultPadding),
              child: InkWell(
                child: Icon(Icons.save),
                onTap: () {
                  if (controller.isDataValid()) {
                    Get.defaultDialog(
                        title: "Konfirmasi Hapus Data",
                        content: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Column(
                            children: [
                              Text(
                                  "Apakah Anda yakin akan menyimp an data tersebut?"),
                              SizedBox(height: defaultPadding * 1.5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButtonCustom(
                                    text: "Simpan",
                                    callback: () {
                                      controller.saveUserData();
                                      Get.defaultDialog(
                                          title: "Perhatian",
                                          middleText:
                                              "Berhasil menyimpan data");
                                      Get.back();
                                      Get.back();
                                      Get.back(result: 'success');
                                    },
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  OutlineButtonCustom(
                                    text: "Batal",
                                    callback: () {
                                      Get.back();
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ));
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
                  initValue: controller.nama.value,
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
                  initValue: controller.alamat.value,
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
                  initValue: controller.nohp.value,
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      style: kLabelStyle.copyWith(color: blackColor),
                    ),
                    ListTile(
                      title: const Text('PRIA'),
                      leading: Radio<String>(
                        toggleable: true,
                        value: "PRIA",
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value.toString();
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('WANITA'),
                      leading: Radio<String>(
                        value: "WANITA",
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value.toString();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  controller.location.value == ""
                      ? "Menunggu Lokasi GPS"
                      : controller.location.value,
                  // controller.latitude.value == 0.0
                  //     ? "Menunggu load GPS"
                  //     : "${controller.latitude.value}, ${controller.longitude.value}",
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
                        File(controller.imagepath.value),
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
