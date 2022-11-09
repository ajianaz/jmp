import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../global_widget/button/elevated_button_custom.dart';
import '../../../global_widget/button/outline_button_custom.dart';
import '../../../global_widget/text_view.dart';
import '../../values/dimens.dart';

String getTime(int timestamp) {
  final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return dateTime.toString().substring(0, 16);
}

dynamic getHeigthFull(BuildContext context) {
  return context.width >= minWidthDrawer
      ? context.height - 56
      : context.height - 120;
}

isMobileWidth(BuildContext context) {
  return context.width <= minWidthDrawer;
}

dialogUmum(String title, text) {
  Get.defaultDialog(title: title.toUpperCase(), middleText: text);
}

dialogDinamis(title, text, onConfirm, onCancel) {
  Get.defaultDialog(
    title: title,
    content: Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 2, vertical: defaultPadding),
      width: double.infinity,
      child: Column(
        children: [
          TextView(text: text),
          SizedBox(
            height: defaultPadding * 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButtonCustom(
                text: "Yakin",
                callback: onConfirm,
              ),
              OutlineButtonCustom(text: "Batal", callback: onCancel),
            ],
          ),
        ],
      ),
    ),
  );
}
