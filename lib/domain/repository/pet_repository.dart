import 'package:flutter_sample_app/domain/entity/pet.dart';

abstract class PetRepository {
  Future<List<Pet>> getPets();
  Future<List<String>> getPetsCategories();
  Future<Pet?> getPet(int id);
}
