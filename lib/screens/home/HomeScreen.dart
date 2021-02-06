import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/bottomBars/DefaultBottomBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _buildAppBar(),
        bottomNavigationBar: DefaultBottomBar(),
        body: _getFragment(),
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
  
  Widget _getFragment() =>
      Container(
        color: Colors.red,
      );
  
}