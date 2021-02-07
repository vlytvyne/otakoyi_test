import 'package:get/get.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/models/domain/ValueOrError.dart';
import 'package:otakoyi_test/data/models/network/ProductNetworkModel.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/data/repositories/ShopRepository.dart';

const _API_ENDPOINT = 'https://fakestoreapi.com/products';

class FakeShopRepository extends GetConnect implements ShopRepository {
  
  static final instance = FakeShopRepository._createInstance();
  
  FakeShopRepository._createInstance();
  
  @override
  Future<ValueOrError<List<Promotion>, Exception>> getPromotions() async {
    const _PROM_IMAGE_URL_1 = 'https://html5css.ru/css/img_forest.jpg';
    const _PROM_IMAGE_URL_2 = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png';
    const _PROM_IMAGE_URL_3 = 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg';
  
    final promotions = [
      Promotion(
        'From 1 to 31 Dec, 2019',
        '50% OFF',
        _PROM_IMAGE_URL_1
      ),
      Promotion(
        'From 12 to 31 Mar, 2020',
        '40% OFF',
        _PROM_IMAGE_URL_2
      ),
      Promotion(
        'From 25 to 31 Mar, 2021',
        '70% OFF!',
        _PROM_IMAGE_URL_3
      ),
    ];
    
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: promotions),
    );
  }
  
  ///I could also go with retrofit, but just keep things simple in the test app I'm using GetConnect
  @override
  Future<ValueOrError<List<Product>, Exception>> getWomensNewIn() async {
    final response = await get('$_API_ENDPOINT/category/women clothing?limit=10');
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
  Future<ValueOrError<List<Product>, Exception>> getMensNewIn() async {
    final response = await get('$_API_ENDPOINT/category/men clothing?limit=10');
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
      Category('Coats & Jacket', 11, AssetProvider.getImage('jacket.png')),
      Category('Jumpsuits', 172, AssetProvider.getImage('jumpsuit.png')),
      Category('Knitwear', 208, AssetProvider.getImage('knitwear.png')),
      Category('Pyjamas', 45, AssetProvider.getImage('pyjamas.png')),
      Category('Sets & Outfits', 209, AssetProvider.getImage('outfits.png')),
    ];
    
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: categories),
    );
  }

  @override
  Future<ValueOrError<List<Category>, Exception>> getBestCategoriesForMen() {
    final categories = [
      Category('Coats & Jacket', 44, AssetProvider.getImage('jacket.png')),
      Category('Dress', 102, AssetProvider.getImage('dress.png')),
      Category('Knitwear', 24, AssetProvider.getImage('knitwear.png')),
      Category('Sets & Outfits', 90, AssetProvider.getImage('outfits.png')),
      Category('Pyjamas', 12, AssetProvider.getImage('pyjamas.png')),
      Category('Jumpsuits', 64, AssetProvider.getImage('jumpsuit.png')),
    ];
    
    return Future.delayed(
      Duration(seconds: 2),
      () => ValueOrError(value: categories),
    );
  }
  
}