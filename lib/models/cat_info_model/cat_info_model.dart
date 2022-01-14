import 'package:dream_bit_cats/models/cat_image_model/cat_image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_info_model.g.dart';

@JsonSerializable()
class CatInfoModel {
  final String id;
  final String name;
  final String temperament;

  @JsonKey(name: 'life_span')
  final String lifeSpan;
  final String origin;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;

  @JsonKey(name: 'short_legs')
  final int shortLegs;
  final int hypoallergenic;
  final int adaptability;

  @JsonKey(name: 'affection_level')
  final int affectionLevel;

  @JsonKey(name: 'child_friendly')
  final int childFriendly;

  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;

  @JsonKey(name: 'energy_level')
  final int energyLevel;

  @JsonKey(name: 'health_issues')
  final int healthIssues;
  final int intelligence;

  @JsonKey(name: 'social_needs')
  final int socialNeeds;

  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;
  final String description;

  @JsonKey(name: 'alt_names')
  final String? altNames;

  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  final CatImageModel? image;

  const CatInfoModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.lifeSpan,
    required this.origin,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.healthIssues,
    required this.intelligence,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.description,
    this.altNames,
    this.wikipediaUrl,
    this.image,
  });

  factory CatInfoModel.fromJson(Map<String, dynamic> json) => _$CatInfoModelFromJson(json);
}
