import 'package:flutter_sample_app/data/local/favorite_data_source.dart';
import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/domain/repository/pet_repository.dart';
import 'package:flutter_sample_app/presentation/base/base_controller.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final PetRepository _petRepository;

  final RxList<String> categories = RxList();

  final RxList<Pet> pets = RxList();

  HomeController(this._petRepository);

  @override
  void onInit() {
    super.onInit();
    _getPets();
    _getCategories();
  }

  _getPets() async {
    pets.value = await _petRepository.getPets();

    /// this is just for sample otherwise we should query from backend
    FavoriteDataSource.favoritePets.value =
        pets.where((element) => element.favorite).toList();
  }

  _getCategories() async {
    categories.value = await _petRepository.getPetsCategories();
  }

  void onFavoriteToggle(Pet pet) {
    if (pet.favorite)
      FavoriteDataSource.favoritePets.add(pet);
    else
      FavoriteDataSource.favoritePets.remove(pet);
  }
}
