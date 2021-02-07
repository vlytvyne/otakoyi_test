import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AppBarWithDynamicShadow extends StatefulWidget implements PreferredSizeWidget {
  
  final Widget child;
  final ScrollController scrollController;


  const AppBarWithDynamicShadow({Key key, this.scrollController, this.child}) : super(key: key);

  @override
  _AppBarWithDynamicShadowState createState() => _AppBarWithDynamicShadowState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _AppBarWithDynamicShadowState extends State<AppBarWithDynamicShadow> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;

  @override
  void initState() {
    if (widget.scrollController != null) {
      widget.scrollController.addListener(_scrollListener);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: 0.2.seconds,
      lowerBound: 0.0,
      upperBound: 4.0,
    );
    super.initState();
  }

  _scrollListener() {
    if (widget.scrollController.offset > 0) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Material(
          shadowColor: Color.fromRGBO(0x9E, 0x9E, 0x9E, 0.2),
          color: Colors.white,
          elevation: _animationController.value,
          child: child,
        ),
        child: widget.child,
      );
}