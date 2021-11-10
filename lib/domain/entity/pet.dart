import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  final int id;
  final String name;
  final String genre;
  final int sex;
  final double age;
  final double weight;
  final String story;
  final String image;
  bool favorite;

  Pet(this.id, this.name, this.genre, this.sex, this.age, this.weight,
      this.story, this.image, this.favorite);

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
