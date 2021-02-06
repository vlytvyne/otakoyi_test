import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

class PromotionTile extends StatelessWidget {
  
  final Promotion promotion;

  const PromotionTile(
    this.promotion, {
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          children: [
            _buildImage(),
            _buildContent(),
          ],
        ),
      );

  Widget _buildImage() =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: promotion.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 320,
        ),
      );
  
  Widget _buildContent() =>
      Positioned(
        bottom: 66,
        left: 32,
        right: 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromotionDuration(),
            const VerticalMargin(10),
            _buildDescription(),
          ],
        ),
      );
  
  Widget _buildPromotionDuration() =>
      Text(
        promotion.promotionDuration,
        style: const TextStyle(
          color: AppColors.LIGHT_GREY,
          fontSize: 12,
        ),
      );
  
  Widget _buildDescription() =>
      Text(
        promotion.description,
        style: const TextStyle(
          color: AppColors.WHITE,
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
      );
  
}