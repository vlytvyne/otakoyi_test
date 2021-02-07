import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';
import 'package:otakoyi_test/widgets/buttons/ClickableText.dart';
import 'package:otakoyi_test/widgets/grids/CategoriesGrid.dart';
import 'package:otakoyi_test/widgets/other/DefaultTabView.dart';
import 'package:otakoyi_test/widgets/other/PromotionsCarousel.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';
import 'package:otakoyi_test/widgets/sections/NewInSection.dart';
import 'package:otakoyi_test/widgets/tabBars/DefaultTabBar.dart';
import 'package:otakoyi_test/widgets/tiles/CategoryTile.dart';

class HomeFragment extends StatefulWidget {
  
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: AppColors.BACKGROUND,
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
  
  Widget _buildBody() =>
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalMargin(20),
              PromotionsCarousel(promotions),
              NewInSection(
                productsCount: 604,
                sectionName: "Woman's",
                products: products,
                theme: NewInSectionTheme.LIGHT,
                padding: const EdgeInsets.only(bottom: 30),
              ),
              NewInSection(
                productsCount: 291,
                sectionName: "Men's",
                products: products,
                theme: NewInSectionTheme.DARK,
                padding: const EdgeInsets.symmetric(vertical: 30),
              ),
              const VerticalMargin(30),
              _buildBestCategoriesTitle(),
              const VerticalMargin(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DefaultTabView(
                  firstTabTitle: 'for women',
                  secondTabTitle: 'for men',
                  firstTab: CategoriesGrid(
                    categories: categories1,
                  ),
                  secondTab: CategoriesGrid(
                    categories: categories2,
                  ),
                ),
              ),
              const VerticalMargin(62)
            ],
          ),
        ),
      );
  
  Widget _buildBestCategoriesTitle() =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Best\nCategories',
              style: const TextStyle(
                color: AppColors.BLACK,
                fontWeight: FontWeight.w900,
                fontSize: 18
              ),
            ),
            Spacer(),
            ClickableText('See all'),
          ],
        ),
      );
  
}

final categories1 = [
  Category('Name', 100, AssetProvider.getImage('dress.png')),
  Category('Name', 100, AssetProvider.getImage('jacket.png')),
  Category('Name', 100, AssetProvider.getImage('jumpsuit.png')),
  Category('Name', 100, AssetProvider.getImage('dress.png')),
  Category('Name', 100, AssetProvider.getImage('jacket.png')),
  Category('Name', 100, AssetProvider.getImage('jumpsuit.png')),
];

final categories2 = [
  Category('Name', 100, AssetProvider.getImage('jumpsuit.png')),
  Category('Name', 100, AssetProvider.getImage('dress.png')),
  Category('Name', 100, AssetProvider.getImage('jacket.png')),
  Category('Name', 100, AssetProvider.getImage('jumpsuit.png')),
  Category('Name', 100, AssetProvider.getImage('dress.png')),
  Category('Name', 100, AssetProvider.getImage('jacket.png')),
];

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

final products = [
  Product(
    'Name name namedsakdmkal dmkas m',
    'https://media.thereformation.com/image/upload/q_auto:eco/c_scale,w_auto:breakpoints_100_2560_9_20:824/v1/prod/product_images/winslow-dress/navy/5c3cf396f35be23e8da597c0/original.jpg',
    'Size',
    'Price',
  ),
  Product(
    'Name',
    'https://assets.vogue.com/photos/5f341f6f4721c86585cbb800/1:1/w_1079,h_1079,c_limit/fullsizeoutput_6bcd_1_1080x.jpg',
    'Size',
    'Price',
  ),
  Product(
    'Name',
    'https://media.thereformation.com/image/upload/q_auto:eco/c_scale,w_auto:breakpoints_100_2560_9_20:824/v1/prod/product_images/winslow-dress/navy/5c3cf396f35be23e8da597c0/original.jpg',
    'Size',
    'Price',
  ),
  Product(
    'Name',
    'https://media.thereformation.com/image/upload/q_auto:eco/c_scale,w_auto:breakpoints_100_2560_9_20:824/v1/prod/product_images/winslow-dress/navy/5c3cf396f35be23e8da597c0/original.jpg',
    'Size',
    'Price',
  ),
  Product(
    'Name',
    'https://media.thereformation.com/image/upload/q_auto:eco/c_scale,w_auto:breakpoints_100_2560_9_20:824/v1/prod/product_images/winslow-dress/navy/5c3cf396f35be23e8da597c0/original.jpg',
    'Size',
    'Price',
  ),
  Product(
    'Name',
    'https://media.thereformation.com/image/upload/q_auto:eco/c_scale,w_auto:breakpoints_100_2560_9_20:824/v1/prod/product_images/winslow-dress/navy/5c3cf396f35be23e8da597c0/original.jpg',
    'Size',
    'Price',
  ),
];