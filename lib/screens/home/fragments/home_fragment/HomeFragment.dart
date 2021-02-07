import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/screens/home/fragments/home_fragment/HomeFragmentBloc.dart';
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
  final _bloc = HomeFragmentBloc();
  
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
      Obx(
        () {
          if (_bloc.loadingObs.value) {
            return _buildLoading();
          } else {
            if (_bloc.errorObs.value != null) {
              return _buildError();
            } else {
              return _buildContent();
            }
          }
        }
      );
  
  Widget _buildLoading() =>
      Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.BLACK),
        )
      );
  
  Widget _buildError() =>
      Center(
        child: Text(
          _bloc.errorObs.value.toString(),
        ),
      );

  Widget _buildContent() {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          const VerticalMargin(20),
          PromotionsCarousel(_bloc.promotionsObs),
          NewInSection(
            productsCount: 604,
            sectionName: "Woman's",
            products: _bloc.womenNewInObs,
            theme: NewInSectionTheme.LIGHT,
            padding: const EdgeInsets.only(bottom: 30),
          ),
          NewInSection(
            productsCount: 291,
            sectionName: "Men's",
            products: _bloc.menNewInObs,
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
                categories: _bloc.bestCategoriesForWomenObs,
              ),
              secondTab: CategoriesGrid(
                categories: _bloc.bestCategoriesForMenObs,
              ),
            ),
          ),
          const VerticalMargin(20),
        ],
      ),
    );
  }
  
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
    _bloc.dispose();
    super.dispose();
  }
  
}