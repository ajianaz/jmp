import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../global_widget/button/elevated_button_custom.dart';
import '../../../global_widget/button/outline_button_custom.dart';
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
