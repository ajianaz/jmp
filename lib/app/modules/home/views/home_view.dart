import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:juniormobileprogrammer/app/core/values/colors.dart';
import 'package:juniormobileprogrammer/app/core/values/dimens.dart';
import 'package:juniormobileprogrammer/app/data/model/user_model.dart';
import 'package:juniormobileprogrammer/app/global_widget/button/elevated_button_custom.dart';
import 'package:juniormobileprogrammer/app/global_widget/button/outline_button_custom.dart';
import 'package:juniormobileprogrammer/app/global_widget/text_field.dart';
import 'package:juniormobileprogrammer/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print("Loading");
    controller.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pengguna'),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: defaultPadding),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    var data = await Get.toNamed(
                      Routes.INPUT_DATA,
                    );
                    print(data);
                    if (data == 'success') controller.getUsers();
                  },
                  child: Icon(Icons.add),
                ),
                // SizedBox(
                //   width: defaultPadding,
                // ),
                // InkWell(
                //   child: Icon(Icons.refresh),
                //   onTap: () =>
                // ),
              ],
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getUsers();
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.listUser.length,
              itemBuilder: (context, position) {
                UserModel user = controller.listUser[position];
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DETAIL, arguments: user);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: defaultPadding * .2),
                    color: whiteColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.file(
                              File(user.path.toString()),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: defaultPadding,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(
                                  height: defaultPadding / 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: defaultPadding / 2,
                                    ),
                                    Text(
                                      user.address.toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: defaultPadding / 2,
                                    ),
                                    Text(
                                      user.phoneNumber.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () async {
                                  var data = await Get.toNamed(
                                      Routes.INPUT_DATA,
                                      arguments: [
                                        {"position": position},
                                        {"user": user}
                                      ]);
                                  print(data);
                                  if (data == 'success') controller.getUsers();
                                }),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "Konfirmasi Hapus Data",
                                      content: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: defaultPadding),
                                        child: Column(
                                          children: [
                                            Text(
                                                "Apakah Anda yakin akan menghapus data tersebut?"),
                                            SizedBox(
                                                height: defaultPadding * 1.5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButtonCustom(
                                                  text: "Hapus",
                                                  callback: () {
                                                    controller.delete(position);
                                                    Get.back();
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
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  updateUser(int pos, UserModel user) {
    Get.defaultDialog(
        title: "Ubah Data User",
        content: Container(
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
            ],
          ),
        ));
  }
}
