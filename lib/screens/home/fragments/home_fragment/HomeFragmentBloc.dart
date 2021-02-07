import 'package:get/get.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/models/domain/ValueOrError.dart';
import 'package:otakoyi_test/data/repositories/FakeShopRepository.dart';
import 'package:otakoyi_test/data/repositories/ShopRepository.dart';

class HomeFragmentBloc {
  
  final loadingObs = RxBool(true);
  final errorObs = Rx<Exception>();
  
  final promotionsObs = List<Promotion>().obs;
  final womenNewInObs = List<Product>().obs;
  final menNewInObs = List<Product>().obs;
  final bestCategoriesForWomenObs = List<Category>().obs;
  final bestCategoriesForMenObs = List<Category>().obs;
  
  final ShopRepository shopRepository = FakeShopRepository.instance;
  
  HomeFragmentBloc() {
    _fetchData();
  }
  
  Future<void> _fetchData() async {
    loadingObs.value = true;
    final responses = await Future.wait([
      shopRepository.getPromotions(),
      shopRepository.getWomensNewIn(),
      shopRepository.getMensNewIn(),
      shopRepository.getBestCategoriesForWomen(),
      shopRepository.getBestCategoriesForMen(),
    ]);
    if (responses.hasErrors) {
      errorObs.value = responses.firstError;
    } else {
      promotionsObs.assignAll(responses[0].value as List<Promotion>);
      womenNewInObs.assignAll(responses[1].value as List<Product>);
      menNewInObs.assignAll(responses[2].value as List<Product>);
      bestCategoriesForWomenObs.assignAll(responses[3].value as List<Category>);
      bestCategoriesForMenObs.assignAll(responses[4].value as List<Category>);
    }
    loadingObs.value = false;
  }
  
  dispose() {
    loadingObs.close();
    errorObs.close();
    promotionsObs.close();
    womenNewInObs.close();
    menNewInObs.close();
    bestCategoriesForWomenObs.close();
    bestCategoriesForMenObs.close();
  }
  
}