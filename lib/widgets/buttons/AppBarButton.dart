import 'package:flutter/material.dart';
import 'package:otakoyi_test/widgets/other/RasterSvgImage.dart';

class AppBarButton extends StatelessWidget {
  
  final String fullIconPath;
  final VoidCallback onClick;

  const AppBarButton(
    this.fullIconPath, {
    Key key,
    this.onClick,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      InkResponse(
        radius: 24,
        onTap: () => onClick?.call(),
        /// I would rather go with SVG here but when icon is exported from the Figma in SVG
        /// the resulting SVG is different from what we have on the design (ugly).
        child: RasterSvgImage(
          fullIconPath,
          width: 28,
          height: 28,
        ),
      );
  
}