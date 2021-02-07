import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/data/repositories/FakeShopRepository.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/appBars/AppBarWithDynamicShadow.dart';
import 'package:otakoyi_test/widgets/appBars/DefaultAppBar.dart';
import 'package:otakoyi_test/widgets/buttons/AppBarButton.dart';
import 'package:otakoyi_test/widgets/buttons/ClickableText.dart';
import 'package:otakoyi_test/widgets/grids/CategoriesGrid.dart';
import 'package:otakoyi_test/widgets/other/DefaultTabView.dart';
import 'package:otakoyi_test/widgets/other/PromotionsCarousel.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';
import 'package:otakoyi_test/widgets/sections/NewInSection.dart';

class HomeFragment extends StatefulWidget {
  
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  
  final _scrollController = ScrollController();
  
  @override
  void initState() {
    FakeShopRepository.instance.getMensNewIn().then(
          (value) => print(value.value.length),
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: AppColors.BACKGROUND,
        appBar: _buildAppBar(),
        body: _buildBody(),
      );
  
  Widget _buildAppBar() =>
      AppBarWithDynamicShadow(
        scrollController: _scrollController,
        child: DefaultAppBar(
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
        ),
      );
  
  Widget _buildBody() =>
      SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const VerticalMargin(20),
              PromotionsCarousel(promotions),
              NewInSection(
                productsCount: 604,
                sectionName: "Woman's",
                products: [],
                theme: NewInSectionTheme.LIGHT,
                padding: const EdgeInsets.only(bottom: 30),
              ),
              NewInSection(
                productsCount: 291,
                sectionName: "Men's",
                products: [],
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
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
}