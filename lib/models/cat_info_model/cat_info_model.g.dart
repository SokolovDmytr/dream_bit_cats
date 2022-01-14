// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatInfoModel _$CatInfoModelFromJson(Map<String, dynamic> json) {
  return CatInfoModel(
    id: json['id'] as String,
    name: json['name'] as String,
    temperament: json['temperament'] as String,
    lifeSpan: json['life_span'] as String,
    origin: json['origin'] as String,
    experimental: json['experimental'] as int,
    hairless: json['hairless'] as int,
    natural: json['natural'] as int,
    rare: json['rare'] as int,
    shortLegs: json['short_legs'] as int,
    hypoallergenic: json['hypoallergenic'] as int,
    adaptability: json['adaptability'] as int,
    affectionLevel: json['affection_level'] as int,
    childFriendly: json['child_friendly'] as int,
    dogFriendly: json['dog_friendly'] as int,
    energyLevel: json['energy_level'] as int,
    healthIssues: json['health_issues'] as int,
    intelligence: json['intelligence'] as int,
    socialNeeds: json['social_needs'] as int,
    strangerFriendly: json['stranger_friendly'] as int,
    description: json['description'] as String,
    altNames: json['alt_names'] as String?,
    wikipediaUrl: json['wikipedia_url'] as String?,
    image: json['image'] == null
        ? null
        : CatImageModel.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CatInfoModelToJson(CatInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'origin': instance.origin,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'short_legs': instance.shortLegs,
      'hypoallergenic': instance.hypoallergenic,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'description': instance.description,
      'alt_names': instance.altNames,
      'wikipedia_url': instance.wikipediaUrl,
      'image': instance.image,
    };
