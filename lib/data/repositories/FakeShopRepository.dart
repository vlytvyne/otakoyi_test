import 'package:get/get.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/models/domain/ValueOrError.dart';
import 'package:otakoyi_test/data/models/network/ProductNetworkModel.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/data/repositories/ShopRepository.dart';

class FakeShopRepository extends GetConnect implements ShopRepository {
  
  static final instance = FakeShopRepository._createInstance();
  
  FakeShopRepository._createInstance();
  
  @override
  Future<ValueOrError<List<Promotion>, Exception>> getPromotions() async {
    const _MOCK_IMAGE_URL_1 = 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg';
    const _MOCK_IMAGE_URL_2 = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png';
    const _MOCK_IMAGE_URL_3 = 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg';
    
    const images = [
      _MOCK_IMAGE_URL_1,
      _MOCK_IMAGE_URL_2,
      _MOCK_IMAGE_URL_3,
    ];
  
    final promotions = images.map((imageUrl) => Promotion(
        'From 1 to 31 Dec, 2019',
        '50% OFF',
        imageUrl
    )).toList();
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: promotions),
    );
  }
  
  ///I would rather go with retrofit, but just keep things simple in test app use GetConnect
  @override
  Future<ValueOrError<List<Product>, Exception>> getWomensNewIn() async {
    final response = await get('https://fakestoreapi.com/products/category/women clothing?limit=10');
    if (response.isOk) {
      return ValueOrError(
        value: (response.body as List<Map<String, dynamic>>).map(
          (e) => ProductNetworkModel.fromJson(e)
        ).toList()
      );
    } else {
      if (response.status.connectionError) {
        return ValueOrError(error: Exception("Connectivity issue"));
      } else {
        return ValueOrError(error: Exception("response code: " + response.status.code.toString()));
      }
    }
  }

  @override
  Future<ValueOrError<List<Product>, Exception>> getMensNewIn() async {
    final response = await get('https://fakestoreapi.com/products/category/men clothing?limit=10');
    if (response.isOk) {
      return ValueOrError(
        value: (response.body as List<dynamic>).map(
          (e) => ProductNetworkModel.fromJson(e)
        ).toList()
      );
    } else {
      if (response.status.connectionError) {
        return ValueOrError(error: Exception("Connectivity issue"));
      } else {
        return ValueOrError(error: Exception("response code: " + response.status.code.toString()));
      }
    }
  }

  @override
  Future<ValueOrError<List<Category>, Exception>> getBestCategoriesForWomen() {
    final categories = [
      Category('Dress', 58, AssetProvider.getImage('dress.png')),
      Category('Jacket', 11, AssetProvider.getImage('jacket.png')),
      Category('Jumsuit', 172, AssetProvider.getImage('jumpsuit.png')),
      Category('Dress again??', 208, AssetProvider.getImage('dress.png')),
      Category('Jacket again, rly?', 45, AssetProvider.getImage('jacket.png')),
      Category('Jumpsuit, ok I see', 209, AssetProvider.getImage('jumpsuit.png')),
    ];
    
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: categories),
    );
  }

  @override
  Future<ValueOrError<List<Category>, Exception>> getBestCategoriesForMen() {
    final categories = [
      Category('Jumpsuit', 12, AssetProvider.getImage('jumpsuit.png')),
      Category('Dress something', 45, AssetProvider.getImage('dress.png')),
      Category('Jacket', 23, AssetProvider.getImage('jacket.png')),
      Category('Jumpsuit', 67, AssetProvider.getImage('jumpsuit.png')),
      Category('Name', 56, AssetProvider.getImage('dress.png')),
      Category('Jacketoo', 123, AssetProvider.getImage('jacket.png')),
    ];
    
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: categories),
    );
  }
  
}