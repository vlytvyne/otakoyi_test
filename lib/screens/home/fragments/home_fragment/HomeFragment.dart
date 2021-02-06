import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';
import 'package:otakoyi_test/widgets/other/PromotionsCarousel.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

const _MOCK_IMAGE_URL_1 = 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg';
const _MOCK_IMAGE_URL_2 = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png';
const _MOCK_IMAGE_URL_3 = 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg';

const images = [
  _MOCK_IMAGE_URL_1,
  _MOCK_IMAGE_URL_2,
  _MOCK_IMAGE_URL_3,
];

class HomeFragment extends StatefulWidget {
  
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: AppColors.WHITE_BACKGROUND,
        appBar: _buildAppBar(),
        body: _buildBody(),
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
  
  Widget _buildBody() {
    final promotions = images.map((imageUrl) => Promotion(
      'From 1 to 31 Dec, 2019',
      '50% OFF',
      imageUrl
    )).toList();
    
    return SingleChildScrollView(
      child: Column(
        children: [
          const VerticalMargin(20),
          PromotionsCarousel(promotions),
        ],
      ),
    );
  }
  
}
