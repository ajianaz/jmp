import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widget/text_field.dart';
import '../controllers/input_data_controller.dart';

class InputDataView extends GetView<InputDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('InputDataView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                buildTextField(
                  "Nama",
                  "Anaz S. Aji",
                  controller.nama,
                  TextInputType.text,
                  icon: Icons.person,
                ),
              ],
            ),
          ),
        ));
  }
}
