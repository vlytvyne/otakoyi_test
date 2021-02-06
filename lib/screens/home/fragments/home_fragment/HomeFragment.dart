import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';

class HomeFragment extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: Text('HOME'),
        ),
      );

  DefaultAppBar _buildAppBar() =>
      DefaultAppBar(
        actionButtons: [
          AppBarButton(
            AssetProvider.getIcon('search_outlined.svg')
          ),
          AppBarButton(
            AssetProvider.getIcon('like_outlined.svg')
          ),
          AppBarButton(
            AssetProvider.getIcon('cart_outlined.svg')
          ),
        ],
      );
  
}