import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/remote/rest_client.dart';
import 'package:flutter_sample_app/presentation/core/route/app_pages.dart';
import 'package:flutter_sample_app/presentation/core/route/app_routes.dart';
import 'package:flutter_sample_app/presentation/core/values/colors.dart';
import 'package:flutter_sample_app/presentation/page/main/main_bindings.dart';
import 'package:get/get.dart';

void main() {
  _initDependencies();
  runApp(MyApp());
}

_initDependencies() {
  Get.lazyPut<RestClient>(() => RestClient.create());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: Routes.INITIAL,
      initialBinding: MainBindings(),
      getPages: AppPages.pages,
    );
  }
}
