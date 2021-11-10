import 'package:flutter_sample_app/data/repository/pet_repository_impl.dart';
import 'package:flutter_sample_app/domain/repository/pet_repository.dart';
import 'package:flutter_sample_app/presentation/page/favorite/favorite_controller.dart';
import 'package:flutter_sample_app/presentation/page/home/home_controller.dart';
import 'package:flutter_sample_app/presentation/page/main/main_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut<PetRepository>(() => PetRepositoryImpl(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => FavoriteController());
  }
}
