import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/AppColors.dart';

class RoundShadowedButton extends StatelessWidget {
  
  final double size;
  final VoidCallback onClick;
  final Widget child;
  
  const RoundShadowedButton({
    Key key,
    @required this.size,
    @required this.child,
    this.onClick,
  }) : super(key: key);

  final btnDecoration = const BoxDecoration(
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
  
  @override
  Widget build(BuildContext context) =>
      Container(
        width: size,
        height: size,
        decoration: btnDecoration,
        child: Material(
          shape: CircleBorder(),
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              onClick?.call();
            },
            child: Center(
              child: child,
            ),
          ),
        ),
      );
  
}