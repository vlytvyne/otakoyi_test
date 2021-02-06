import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/AppColors.dart';
import 'package:otakoyi_test/widgets/buttons/BottomBarButton.dart';

class BottomBarItem {
  
  final String iconFullPath;
  final String title;

  BottomBarItem(this.iconFullPath, this.title);
}

class DefaultBottomBar extends StatelessWidget {
  
  final List<BottomBarItem> items;
  final Function (int) onItemClick;
  
  final int selectedItemIndex;

  const DefaultBottomBar({
    Key key,
    @required this.items,
    @required this.selectedItemIndex,
    this.onItemClick,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: AppColors.BLACK,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0x9E, 0x9E, 0x9E, 0.1),
              spreadRadius: 3,
              blurRadius: 3,
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: SizedBox(
              height: 62,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.map(_buildButton).toList(),
                ),
              ),
            ),
          ));
  
  Widget _buildButton(BottomBarItem item) {
    final currentIndex = items.indexOf(item);
  
    return BottomBarButton(
      iconFullPath: item.iconFullPath,
      title: item.title,
      isSelected: currentIndex == selectedItemIndex,
      onClick: () {
        if (currentIndex != selectedItemIndex) {
          onItemClick?.call(currentIndex);
        }
      },
    );
  }
  
}