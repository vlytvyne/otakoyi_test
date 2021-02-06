import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/buttons/TextSpanButton.dart';
import 'package:otakoyi_test/widgets/other/ProgressDotsIndicators.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';
import 'package:otakoyi_test/widgets/tiles/ProductTile.dart';

enum NewInSectionTheme {
  LIGHT,
  DARK,
}

class NewInSection extends StatelessWidget {
  
  final int productsCount;
  final String sectionName;
  final List<Product> products;
  final NewInSectionTheme theme;
  final EdgeInsets padding;

  const NewInSection({
    Key key,
    @required this.productsCount,
    @required this.sectionName,
    @required this.products,
    this.theme = NewInSectionTheme.LIGHT,
    this.padding,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Container(
        width: double.infinity,
        color: theme == NewInSectionTheme.LIGHT ? AppColors.WHITE : AppColors.BLACK,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _wrapInPadding(_buildProductsCount()),
              const VerticalMargin(8),
              _wrapInPadding(_buildSectionTitle()),
              const VerticalMargin(12),
              _wrapInPadding(TextSpanButton('See more',)),
              const VerticalMargin(22),
              _buildProductsList(),
              const VerticalMargin(30),
              _wrapInPadding(_buildDotsIndicator()),
            ],
          ),
        ),
      );
  
  Widget _wrapInPadding(Widget child) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      );

  Text _buildProductsCount() =>
      Text(
        '$productsCount PRODUCTS',
        style: const TextStyle(
          color: AppColors.LIGHT_GREY,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          letterSpacing: 1,
        ),
      );

  RichText _buildSectionTitle() =>
      RichText(
        text: TextSpan(
          text: "$sectionName ".toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: theme == NewInSectionTheme.LIGHT ? AppColors.BLACK : AppColors.WHITE,
            letterSpacing: 1,
          ),
          children: [
            TextSpan(
              text: 'NEW IN',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: AppColors.DARK_GREY,
              ),
            )
          ]
        ),
      );

  SizedBox _buildProductsList() =>
      SizedBox(
        height: 260,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          separatorBuilder: (_, __) => const HorizontalMargin(8),
          itemBuilder: (_, int index) =>
            ProductTile(
              products[index],
              theme: theme == NewInSectionTheme.LIGHT ? ProductTileTheme.LIGHT : ProductTileTheme.DARk,
            ),
        ),
      );

  ///Don't really know why those dots are on the design
  ProgressDotsIndicators _buildDotsIndicator() =>
      ProgressDotsIndicators(
        count: 3,
        selectedIndex: 0,
        selectedColor: theme == NewInSectionTheme.LIGHT ? AppColors.BLACK : AppColors.GOLD,
      );
  
}