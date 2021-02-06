import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/screens/home/fragments/home_fragment/HomeFragment.dart';
import 'package:otakoyi_test/screens/home/fragments/more_fragment/MoreFragment.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/bottomBars/DefaultBottomBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';

class HomeScreen extends StatefulWidget {
  
  final _fragments = <Widget>[
    HomeFragment(),
    MoreFragment(),
  ];
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _currentFragmentIndex = 0;
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBody: true,
        appBar: _buildAppBar(),
        bottomNavigationBar: _buildBottomBar(),
        body: widget._fragments[_currentFragmentIndex],
      );

  DefaultBottomBar _buildBottomBar() =>
      DefaultBottomBar(
        items: [
          BottomBarItem(
            AssetProvider.getIcon('home_outlined.svg'),
            'Home',
          ),
          BottomBarItem(
            AssetProvider.getIcon('more_filled.svg'),
            'More',
          )
        ],
        selectedItemIndex: _currentFragmentIndex,
        onItemClick: (index) {
          setState(() {
            _currentFragmentIndex = index;
          });
        }
      );

  DefaultAppBar _buildAppBar() =>
      DefaultAppBar(
        actionButtons: [
          AppBarButton(
            AssetProvider.getIcon('search_outlined.png')
          ),
          AppBarButton(
            AssetProvider.getIcon('like_outlined.png')
          ),
          AppBarButton(
            AssetProvider.getIcon('cart_outlined.png')
          ),
        ],
      );
}