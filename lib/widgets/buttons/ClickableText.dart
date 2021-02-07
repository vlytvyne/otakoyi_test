import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/AppColors.dart';

class ClickableText extends StatelessWidget {
  
  final String text;
  final VoidCallback onClick;

  const ClickableText(
    this.text, {
    Key key,
    this.onClick,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick?.call(),
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              color: AppColors.GOLD,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1
            ),
          ),
        ),
      );
  
}