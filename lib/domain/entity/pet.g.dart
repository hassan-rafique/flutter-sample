// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    json['id'] as int,
    json['name'] as String,
    json['genre'] as String,
    json['sex'] as int,
    (json['age'] as num).toDouble(),
    (json['weight'] as num).toDouble(),
    json['story'] as String,
    json['image'] as String,
    json['favorite'] as bool,
  );
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'genre': instance.genre,
      'sex': instance.sex,
      'age': instance.age,
      'weight': instance.weight,
      'story': instance.story,
      'image': instance.image,
      'favorite': instance.favorite,
    };
