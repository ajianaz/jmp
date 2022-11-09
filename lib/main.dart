import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

import 'package:juniormobileprogrammer/app/data/model/user_model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'app/core/values/colors.dart';
import 'app/core/values/strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox(appName);

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());

  final ThemeData theme = ThemeData();
  runApp(
    GetMaterialApp(
      title: appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
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
