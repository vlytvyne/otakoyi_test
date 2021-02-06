import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakoyi_test/screens/home/HomeScreen.dart';

class OtakoyiTestApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Otakoyi Test App',
      theme: _buildTheme(),
      home: HomeScreen(),
    );
  }
  
  ThemeData _buildTheme() =>
      ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}