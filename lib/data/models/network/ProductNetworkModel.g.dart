// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductNetworkModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductNetworkModel _$ProductNetworkModelFromJson(Map<String, dynamic> json) {
  return ProductNetworkModel()
    ..imageUrl = json['image'] as String
    ..name = json['title'] as String
    ..cost = (json['price'] as num)?.toDouble();
}

Map<String, dynamic> _$ProductNetworkModelToJson(
        ProductNetworkModel instance) =>
    <String, dynamic>{
      'image': instance.imageUrl,
      'title': instance.name,
      'price': instance.cost,
    };
