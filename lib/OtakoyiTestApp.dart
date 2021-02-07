import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakoyi_test/data/repositories/FakeShopRepository.dart';
import 'package:otakoyi_test/data/repositories/RepositoryProvider.dart';
import 'package:otakoyi_test/screens/home/HomeScreen.dart';

class OtakoyiTestApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Otakoyi Test App',
      theme: _buildTheme(),
      initialBinding: AppBinding(),
      home: HomeScreen(),
    );
  }
  
  ThemeData _buildTheme() =>
      ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

class AppBinding implements Bindings {
  
  @override
  void dependencies() {
    final repositoryProvider = RepositoryProvider(FakeShopRepository.instance);
    Get.put(repositoryProvider, permanent: true);
  }
  
}