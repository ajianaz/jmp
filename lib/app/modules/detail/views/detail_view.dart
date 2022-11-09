import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:juniormobileprogrammer/app/core/values/dimens.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  Completer<GoogleMapController> mController = Completer();

  @override
  Widget build(BuildContext context) {
    controller.user = Get.arguments;
    controller.update();
    controller.setMarker();
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Data'),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                width: context.width,
                height: 270,
                child: controller.isLoading.value
                    ? SizedBox()
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.markerLocation!,
                        markers: controller.markers,
                        onMapCreated: (GoogleMapController controller) {
                          mController.complete(controller);
                        },
                      ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Image.file(
                    File(controller.user!.path.toString()),
                    height: 250,
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  RowData(
                    icon: Icons.person,
                    text: controller.user!.name.toString(),
                  ),
                  RowData(
                    icon: Icons.home,
                    text: controller.user!.address.toString(),
                  ),
                  RowData(
                    icon: Icons.phone,
                    text: controller.user!.phoneNumber.toString(),
                  ),
                  RowData(
                    icon: Icons.location_on,
                    text:
                        "${controller.user!.latitude}, ${controller.user!.longitude}",
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: defaultPadding,
          ),
          Text(
            text.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
