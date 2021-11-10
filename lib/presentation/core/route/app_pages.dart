import 'package:flutter_sample_app/presentation/page/main/main_bindings.dart';
import 'package:flutter_sample_app/presentation/page/main/main_page.dart';
import 'package:flutter_sample_app/presentation/page/pet/pet_detail_bindings.dart';
import 'package:flutter_sample_app/presentation/page/pet/pet_detail_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.PET_DETAIL,
      page: () => PetDetailPage(),
      binding: PetDetailBindings(),
    ),
  ];
}
