import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: SvgPicture.asset(
          fullIconPath,
          width: 28,
          height: 28,
        ),
      );
  
}