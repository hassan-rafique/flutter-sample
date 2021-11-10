import 'package:flutter_sample_app/data/local/favorite_data_source.dart';
import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/presentation/base/base_controller.dart';
import 'package:get/get.dart';

class FavoriteController extends BaseController {
  final RxList<Pet> favoritePets = FavoriteDataSource.favoritePets;

  void onRemoveFavorite(Pet pet) {
    FavoriteDataSource.favoritePets.remove(pet);
  }
}
