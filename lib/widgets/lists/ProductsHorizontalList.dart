import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';
import 'package:otakoyi_test/widgets/tiles/ProductTile.dart';

class ProductsHorizontalList extends StatelessWidget {
  
  final List<Product> products;
  final EdgeInsets padding;
  final Widget separator;
  final ProductTileTheme tileTheme;

  const ProductsHorizontalList({
    Key key,
    @required this.products,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.separator = const HorizontalMargin(8),
    this.tileTheme = ProductTileTheme.LIGHT,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      SizedBox(
        height: 260,
        child: ListView.separated(
          padding: padding,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (_, __) => separator,
          itemBuilder: (_, int index) =>
            ProductTile(
              products[index],
              theme: tileTheme,
            ),
        ),
      );
  
}