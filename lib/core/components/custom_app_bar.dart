import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/navigator_manager.dart';

class CustomAppBar extends StatelessWidget with NavigatorManager implements PreferredSizeWidget {
  final double preferredHeight;

  const CustomAppBar({
    super.key,
    this.preferredHeight = kToolbarHeight, 
  });

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.scaffoldBackgorundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          navigateToPopWidget(context);
        },
      ),
      bottom: PreferredSize( 
        preferredSize: Size.zero,
        child: Container(),
      ),
    );
  }
}