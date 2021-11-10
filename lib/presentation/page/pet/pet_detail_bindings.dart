import 'package:flutter_sample_app/data/repository/pet_repository_impl.dart';
import 'package:flutter_sample_app/domain/repository/pet_repository.dart';
import 'package:flutter_sample_app/presentation/page/pet/pet_detail_controller.dart';
import 'package:get/get.dart';

class PetDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetRepository>(() => PetRepositoryImpl(Get.find()));
    Get.lazyPut(() => PetDetailController(Get.find(), Get.arguments));
  }
}
