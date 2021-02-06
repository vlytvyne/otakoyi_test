import 'package:flutter/material.dart';
import 'package:otakoyi_test/data/other/AssetProvider.dart';
import 'package:otakoyi_test/widgets/other/margins.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final List<Widget> actionButtons;

  const DefaultAppBar({
    Key key,
    this.actionButtons
  }) : super(key: key);
  
  @override
  Size get preferredSize => Size.fromHeight(60);
  
  @override
  Widget build(BuildContext context) =>
      SafeArea(
        child: Container(
          height: preferredSize.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HorizontalMargin(16),
              _buildUserAvatar(),
              const HorizontalMargin(16),
              _buildLogo(),
              Spacer(),
              _buildActionButtons(),
              const HorizontalMargin(16),
            ],
          ),
        ),
      );
  
  Widget _buildUserAvatar() =>
      Image.asset(
        AssetProvider.getImage('user_avatar.png'),
        width: 44,
        height: 44,
      );
  
  Widget _buildLogo() =>
      Image.asset(
        AssetProvider.getImage('logo.png'),
        width: 86,
        height: 30,
      );

  Widget _buildActionButtons() {
    if (actionButtons == null) {
      return SizedBox.shrink();
    } else {
      return Row(
        children:  actionButtons.expand(
          (element) => [element, const HorizontalMargin(22)]
        ).toList()
        ..removeLast(),
      );
    }
  }
  
}