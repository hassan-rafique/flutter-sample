import 'package:flutter_sample_app/domain/entity/pet.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class RestClient {
  static RestClient create() => RestClient(Dio());

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('pets')
  Future<List<Pet>> getPets();

  @GET('pets')
  Future<List<Pet>> getPet(
    @Query('id') int id,
  );
}

const String apiBaseUrl = 'https://614c67ec59e92d00176ad206.mockapi.io/api/v1/';
