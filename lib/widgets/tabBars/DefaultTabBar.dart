import 'package:flutter/material.dart';
import 'package:otakoyi_test/utils/AppColors.dart';

enum TabNumber {
  FIRST,
  SECOND,
}

class DefaultTabBar extends StatelessWidget {

  final String firstTabText;
  final String secondTabText;
  final TabNumber selectedTab;
  final Function(TabNumber) onTabClick;

  const DefaultTabBar({
    Key key,
    @required this.firstTabText,
    @required  this.secondTabText,
    this.selectedTab = TabNumber.FIRST,
    this.onTabClick,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) =>
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.BLACK,
        ),
        child: Row(
          children: [
            _buildTab(
              firstTabText,
              selectedTab == TabNumber.FIRST,
              () => onTabClick?.call(TabNumber.FIRST),
            ),
            _buildDivider(),
            _buildTab(
              secondTabText,
              selectedTab == TabNumber.SECOND,
              () => onTabClick?.call(TabNumber.SECOND),
            ),
          ],
        ),
      );

  Container _buildDivider() =>
      Container(
        height: 25,
        width: 1,
        color: AppColors.LIGHT_GREY,
      );
  
  Widget _buildTab(String text, bool isSelected, VoidCallback onClick) =>
      Expanded(
        child: GestureDetector(
          onTap: () => onClick(),
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? AppColors.WHITE : AppColors.LIGHT_GREY,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      );
  
}