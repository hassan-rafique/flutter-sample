import 'package:flutter_sample_app/data/remote/rest_client.dart';
import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:flutter_sample_app/domain/repository/pet_repository.dart';

class PetRepositoryImpl extends PetRepository {
  final RestClient _restClient;

  PetRepositoryImpl(this._restClient);

  @override
  Future<List<Pet>> getPets() => _restClient.getPets();

  @override
  Future<List<String>> getPetsCategories() {
    return Future(() => ['Cats', 'Dogs', 'Rabbits', 'Parrots', 'Fish']);
  }

  @override
  Future<Pet?> getPet(int id) async {
    final result = await _restClient.getPet(id);
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
