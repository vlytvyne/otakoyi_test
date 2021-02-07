import 'package:json_annotation/json_annotation.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';

part 'ProductNetworkModel.g.dart';

@JsonSerializable()
class ProductNetworkModel extends Product {
  
  @override
  @JsonKey(name: 'image')
  String imageUrl;
  
  @override
  @JsonKey(name: 'title')
  String name;
  
  @JsonKey(name: 'price')
  double cost;

  @override
  String get price => "$cost SAR";
  
  @override
  String get size => "6 / 20 Tall";
  
  ProductNetworkModel();

  factory ProductNetworkModel.fromJson(Map<String, dynamic> json) => _$ProductNetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductNetworkModelToJson(this);
  
}