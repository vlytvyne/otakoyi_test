import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RasterSvgImage extends StatelessWidget {
  
  final String imageFullPath;
  final BoxFit fit;
  final double width;
  final double height;

  const RasterSvgImage(
    this.imageFullPath, {
    Key key,
    this.fit: BoxFit.none,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);
  
  bool get isSvg => imageFullPath?.split('.')?.last == 'svg';

  @override
  Widget build(BuildContext context) =>
    isSvg
      ? SvgPicture.asset(
        imageFullPath,
        width: width,
        height: height,
      )
      : Image.asset(
        imageFullPath,
        width: width,
        height: height,
      );
}
