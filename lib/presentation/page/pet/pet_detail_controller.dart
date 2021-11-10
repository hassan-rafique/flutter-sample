import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/domain/repository/pet_repository.dart';
import 'package:flutter_sample_app/presentation/base/base_controller.dart';
import 'package:get/get.dart';

class PetDetailController extends BaseController {
  final PetRepository _petRepository;
  final Pet _petArg;

  late Rx<Pet> pet;

  PetDetailController(this._petRepository, this._petArg) {
    pet = Rx(_petArg);
  }

  @override
  void onInit() {
    super.onInit();
    _getPetDetail();
  }

  void _getPetDetail() async {
    final result = await _petRepository.getPet(1);
    if (result != null) pet.value = result;
  }
}
