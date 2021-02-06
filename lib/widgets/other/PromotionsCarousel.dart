import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otakoyi_test/data/models/domain/Promotion.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/buttons/RoundShadowedButton.dart';
import 'package:otakoyi_test/widgets/other/ProgressDotsIndicators.dart';
import 'package:otakoyi_test/widgets/tiles/PromotionTile.dart';

class PromotionsCarousel extends StatefulWidget {

  final List<Promotion> promotions;


  PromotionsCarousel(
    this.promotions, {
    Key key,
  }) : super(key: key);

  @override
  _PromotionsCarouselState createState() => _PromotionsCarouselState();
}

class _PromotionsCarouselState extends State<PromotionsCarousel> {
  
  final _carouselController = CarouselController();
  
  int _currentSelectedDot = 0;

  @override
  Widget build(BuildContext context) =>
      SizedBox(
        height: 360,
        child: Stack(
          children: [
            _buildSlider(),
            _buildDotsIndicator(),
            _buildNextButton(),
          ],
        ),
      );

  Widget _buildSlider() =>
      CarouselSlider(
        items: widget.promotions.map((promotion) => PromotionTile(promotion)).toList(),
        carouselController: _carouselController,
        options: CarouselOptions(
          viewportFraction: 0.9,
          height: 320,
          onPageChanged: (int index, reason) {
            setState(() {
              _currentSelectedDot = index;
            });
          }
        ),
      );

  Widget _buildDotsIndicator() =>
      Positioned(
        left: 60,
        bottom: 62,
        child: ProgressDotsIndicators(
          count: widget.promotions.length,
          selectedIndex: _currentSelectedDot,
        ),
      );
  
  final nextBtnDecoration = const BoxDecoration(
      color: AppColors.WHITE,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0x9E, 0x9E, 0x9E, 0.3),
          spreadRadius: 3,
          blurRadius: 3,
        )
      ]
    );
  
  Widget _buildNextButton() =>
      Positioned(
        bottom: 10,
        right: 40,
        child: RoundShadowedButton(
          size: 60,
          onClick: () {
            _carouselController.nextPage(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          },
          child: SvgPicture.asset(
            AssetProvider.getIcon('arrow_right.svg'),
            width: 28,
            height: 28,
          ),
        ),
      );
  
}