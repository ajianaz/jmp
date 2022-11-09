import 'package:get/get.dart';

import 'package:juniormobileprogrammer/app/modules/detail/bindings/detail_binding.dart';
import 'package:juniormobileprogrammer/app/modules/detail/views/detail_view.dart';
import 'package:juniormobileprogrammer/app/modules/home/bindings/home_binding.dart';
import 'package:juniormobileprogrammer/app/modules/home/views/home_view.dart';
import 'package:juniormobileprogrammer/app/modules/input_data/bindings/input_data_binding.dart';
import 'package:juniormobileprogrammer/app/modules/input_data/views/input_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_DATA,
      page: () => InputDataView(),
      binding: InputDataBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
