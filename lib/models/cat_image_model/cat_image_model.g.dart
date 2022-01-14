// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatImageModel _$CatImageModelFromJson(Map<String, dynamic> json) {
  return CatImageModel(
    height: json['height'] as int?,
    width: json['width'] as int?,
    id: json['id'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$CatImageModelToJson(CatImageModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'id': instance.id,
      'url': instance.url,
    };
