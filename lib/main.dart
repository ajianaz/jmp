import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/core/values/colors.dart';
import 'app/core/values/strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(appName);

  final ThemeData theme = ThemeData();
  runApp(
    GetMaterialApp(
      title: appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: theme.copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        // canvasColor: bgColor,
        // font
        primaryTextTheme: theme.textTheme.apply(
          fontFamily: 'Roboto',
        ),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: bodyTextColor),
        //   bodyText2: TextStyle(color: bodyTextColor),
        // ),
      ),
    ),
  );
}
