import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

class ProgressDotsIndicators extends StatelessWidget {
  
  final int count;
  final int selectedIndex;
  
  final Color unselectedColor;
  final Color selectedColor;

  const ProgressDotsIndicators({
    Key key,
    @required this.count,
    @required this.selectedIndex,
    this.unselectedColor = AppColors.LIGHT_GREY,
    this.selectedColor = AppColors.GOLD,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Row(
        children:
          List.generate(count, (index) => index)
            .expand((index) => [
              _ProgressDot(
                size: index == selectedIndex ? 8 : 4,
                color: index == selectedIndex ? selectedColor : unselectedColor,
              ),
              HorizontalMargin(8)
            ]).toList()..removeLast(),
      );
  
}

class _ProgressDot extends StatelessWidget {
  
  final Color color;
  final double size;

  const _ProgressDot({
    Key key,
    @required this.color,
    @required this.size,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
  
}