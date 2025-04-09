import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_padding.dart';
import 'package:heraninda/core/constants/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalLarge(),
      child: Container(
        height: 60.0.h,
        decoration: BoxDecoration(
          color: AppColor.navBarColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceAround, 
          children: [
            _buildNavItem(0, Assets.icon.icHome, 'Home'),
            _buildNavItem(1, Assets.icon.icCart, 'Cart'),
            _buildNavItem(2, Assets.icon.icHeart, 'Favorite'),
            _buildNavItem(3, Assets.icon.icPersonOutline, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconData, String? label) {
    final isSelected = widget.currentIndex == index;

    return InkWell(
      onTap: () => widget.onTap(index),
      child: Padding(
        padding:  AppPadding.horizontalSmall(), //const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding:
             AppPadding.allSmall() //const EdgeInsets.symmetric(vertical: 8, horizontal: 8.0)
        ,
          decoration:
              isSelected
                  ? BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  )
                  : BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColor.deepTealGray,
                        AppColor.deepCharcoalGreen,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    isSelected ? EdgeInsets.zero : const EdgeInsets.all(3.0),
                child: SvgPicture.asset(iconData),
              ),
              if (label != null && isSelected)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    label,
                    style: AppTextStyle.instrumentSansRegular(
                      context,
                    ).copyWith(color: AppColor.appWhiteColor),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
