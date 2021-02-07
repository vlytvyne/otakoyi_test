import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/models/domain/ValueOrError.dart';

abstract class ShopRepository {

  Future<ValueOrError<List<Promotion>, Exception>> getPromotions();

  Future<ValueOrError<List<Product>, Exception>> getWomensNewIn();
  
  Future<ValueOrError<List<Product>, Exception>> getMensNewIn();
  
  Future<ValueOrError<List<Category>, Exception>> getBestCategoriesForWomen();
  
  Future<ValueOrError<List<Category>, Exception>> getBestCategoriesForMen();

}