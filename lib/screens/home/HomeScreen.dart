import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/screens/home/fragments/catalog_fragment/CatalogFragment.dart';
import 'package:otakoyi_test/screens/home/fragments/home_fragment/HomeFragment.dart';
import 'package:otakoyi_test/screens/home/fragments/men_fragment/MenFragment.dart';
import 'package:otakoyi_test/screens/home/fragments/more_fragment/MoreFragment.dart';
import 'package:otakoyi_test/screens/home/fragments/women_fragment/WomenFragment.dart';
import 'package:otakoyi_test/widgets/bottomBars/DefaultBottomBar.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final _fragments = <Widget>[
    HomeFragment(),
    WomenFragment(),
    MenFragment(),
    CatalogFragment(),
    MoreFragment(),
  ];
  
  int _currentFragmentIndex = 0;
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBody: true,
        bottomNavigationBar: _buildBottomBar(),
        body: _fragments[_currentFragmentIndex],
      );

  DefaultBottomBar _buildBottomBar() =>
      DefaultBottomBar(
        items: [
          BottomBarItem(
            AssetProvider.getIcon('home_outlined.svg'),
            'Home',
          ),
          BottomBarItem(
            AssetProvider.getIcon('women_outlined.svg'),
            'Women',
          ),
          BottomBarItem(
            AssetProvider.getIcon('men_outlined.svg'),
            'Men',
          ),
          BottomBarItem(
            AssetProvider.getIcon('catalog_outlined.svg'),
            'Catalog',
          ),
          BottomBarItem(
            AssetProvider.getIcon('more_filled.svg'),
            'More',
          ),
        ],
        selectedItemIndex: _currentFragmentIndex,
        onItemClick: _onBottomBarItemClick,
      );
  
  void _onBottomBarItemClick(int index) {
    setState(() {
      _currentFragmentIndex = index;
    });
  }
}