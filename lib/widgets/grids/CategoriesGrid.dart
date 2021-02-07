import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Category.dart';
import 'package:otakoyi_test/widgets/tiles/CategoryTile.dart';

class CategoriesGrid extends StatelessWidget {
  
  final List<Category> categories;

  const CategoriesGrid({
    Key key,
    @required this.categories
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      GridView.builder(
        itemCount: categories.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8
        ),
        itemBuilder: (BuildContext context, int index) =>
          CategoryGridTile(
            categories[index],
            position: _getTilePosition(index),
          ),
      );
  
  bool get isCategoriesCountEven => categories.length % 2 == 0;

  CategoryTilePosition _getTilePosition(int index) {
    if (index == 0) {
      return CategoryTilePosition.TOP_LEFT;
    } else if (index == 1) {
      return CategoryTilePosition.TOP_RIGHT;
    } else if (index == categories.length - 2 && isCategoriesCountEven) {
      return CategoryTilePosition.BOTTOM_LEFT;
    } else if (index == categories.length - 1) {
      if (isCategoriesCountEven) {
        return CategoryTilePosition.BOTTOM_RIGHT;
      } else {
        return CategoryTilePosition.BOTTOM_LEFT;
      }
    }
    return CategoryTilePosition.OTHER;
  }
  
}