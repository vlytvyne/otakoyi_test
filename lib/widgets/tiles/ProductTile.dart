import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otakoyi_test/data/models/domain/Product.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/buttons/RoundShadowedButton.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

enum ProductTileTheme {
  LIGHT,
  DARk
}

class ProductTile extends StatelessWidget {
  
  final Product product;
  final Function(Product) onLikeClick;
  final Function(Product) onCartClick;
  final ProductTileTheme theme;

  const ProductTile(
    this.product, {
    Key key,
    this.onLikeClick,
    this.onCartClick,
    this.theme,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageStack(),
            const VerticalMargin(6),
            _buildDescription()
          ],
        ),
      );
  
  Widget _buildImageStack() =>
      SizedBox(
        height: 175,
        child: Stack(
          children: [
            _buildImage(),
            _buildCartButton(),
            _buildLikeButton(),
          ],
        ),
      );
  
  Widget _buildImage() =>
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          width: 120,
          height: 160,
          fit: BoxFit.cover,
        ),
      );
  
  Widget _buildCartButton() =>
      Positioned(
        bottom: 0,
        left: 8,
        child: RoundShadowedButton(
          size: 30,
          onClick: () {
            onCartClick?.call(product);
          },
          child: SvgPicture.asset(
            AssetProvider.getIcon('cart_filled.svg'),
            width: 18,
            height: 18,
          )
        ),
      );
  
  Widget _buildLikeButton() =>
      Positioned(
        top: 12,
        right: 12,
        child: GestureDetector(
          onTap: () {
            onLikeClick?.call(product);
          },
          child: SvgPicture.asset(
            AssetProvider.getIcon('like_filled.svg'),
            width: 18,
            height: 18,
          ),
        ),
      );

  Widget _buildDescription() =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildName(),
            const VerticalMargin(6),
            _buildSize(),
            const VerticalMargin(10),
            _buildPrice(),
          ],
        ),
      );
  
  Widget _buildName() =>
      SizedBox(
        height: 30,
        child: Text(
          product.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: theme == ProductTileTheme.LIGHT ? AppColors.BLACK : AppColors.WHITE,
            fontSize: 12,
          ),
        ),
      );
  
  Widget _buildSize() =>
      Text(
        product.size,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: AppColors.DARK_GREY,
          fontSize: 12,
        ),
      );

  Widget _buildPrice() =>
      Text(
        product.price,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: theme == ProductTileTheme.LIGHT ? AppColors.BLACK : AppColors.WHITE,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      );
  
}