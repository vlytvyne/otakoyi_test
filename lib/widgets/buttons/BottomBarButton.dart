import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

class BottomBarButton extends StatelessWidget {
  
  final String iconFullPath;
  final String title;
  final bool isSelected;
  final VoidCallback onClick;

  const BottomBarButton({
    Key key,
    @required this.iconFullPath,
    @required this.title,
    @required this.isSelected,
    this.onClick
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      InkResponse(
        onTap: () => onClick?.call(),
        radius: 28,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              iconFullPath,
              color: isSelected ? AppColors.GOLD : AppColors.LIGHT_GREY,
              width: 28,
              height: 28,
            ),
            const VerticalMargin(2),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                color: isSelected ? AppColors.GOLD : AppColors.LIGHT_GREY,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
  
}