import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

enum CategoryTilePosition {
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
  OTHER,
}

const _positionToBorderRadius = {
  CategoryTilePosition.TOP_LEFT: const BorderRadius.only(topLeft: Radius.circular(20)),
  CategoryTilePosition.TOP_RIGHT: const BorderRadius.only(topRight: Radius.circular(20)),
  CategoryTilePosition.BOTTOM_LEFT: const BorderRadius.only(bottomLeft: Radius.circular(20)),
  CategoryTilePosition.BOTTOM_RIGHT: const BorderRadius.only(bottomRight: Radius.circular(20)),
  CategoryTilePosition.OTHER: const BorderRadius.all(Radius.zero),
};

class CategoryGridTile extends StatelessWidget {
  
  final Category category;
  final CategoryTilePosition position;

  CategoryGridTile(
    this.category, {
    this.position = CategoryTilePosition.OTHER,
  });

  @override
  Widget build(BuildContext context) =>
      Container(
        height: 170,
        decoration: BoxDecoration(
          color: AppColors.CATEGORY_TILE_BACKGROUND,
          borderRadius: _positionToBorderRadius[position],
        ),
        child: Column(
          children: [
            const VerticalMargin(30),
            _buildName(),
            const VerticalMargin(6),
            _buildProductsCount(),
            Spacer(),
            _buildImage(),
          ],
        ),
      );
  
  Widget _buildName() =>
      Text(
        category.name,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: AppColors.BLACK,
        ),
      );
  
  Widget _buildProductsCount() =>
      Text(
        "${category.productsCount} Products",
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.DARK_GREY,
        ),
      );
  
  Widget _buildImage() =>
      Image.asset(
        category.fullImagePath,
        width: 94,
        height: 94,
      );
  
}