import 'package:flutter/material.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';
import 'package:otakoyi_test/widgets/tabBars/DefaultTabBar.dart';

class DefaultTabView extends StatefulWidget {
  
  final String firstTabTitle;
  final String secondTabTitle;
  final Widget firstTab;
  final Widget secondTab;

  const DefaultTabView({
    Key key,
    @required this.firstTabTitle,
    @required this.secondTabTitle,
    @required this.firstTab,
    @required this.secondTab
  }) : super(key: key);

  @override
  _DefaultTabViewState createState() => _DefaultTabViewState();
}

class _DefaultTabViewState extends State<DefaultTabView> {

  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  TabNumber _selectedTab = TabNumber.FIRST;
  
  @override
  Widget build(BuildContext context) =>
      Column(
        children: [
          DefaultTabBar(
            firstTabText: widget.firstTabTitle,
            secondTabText: widget.secondTabTitle,
            selectedTab: _selectedTab,
            onTabClick: (tab) {
              setState(() {
                _selectedTab = tab;
                _crossFadeState = tab == TabNumber.FIRST
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond;
              });
            },
          ),
          const VerticalMargin(8),
          AnimatedCrossFade(
            firstChild: widget.firstTab,
            secondChild: widget.secondTab,
            crossFadeState: _crossFadeState,
            duration: Duration(milliseconds: 300),
          )
        ],
      );
}