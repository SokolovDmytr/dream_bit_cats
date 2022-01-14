import 'package:json_annotation/json_annotation.dart';

part 'cat_image_model.g.dart';

@JsonSerializable()
class CatImageModel {
  final int? height;
  final int? width;
  final String? id;
  final String? url;

  const CatImageModel({
    this.height,
    this.width,
    this.id,
    this.url,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) => _$CatImageModelFromJson(json);
}
