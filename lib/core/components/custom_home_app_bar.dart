import 'package:flutter/material.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_padding.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          AppPadding.horizantalExtraLargePadding(), //const EdgeInsets.symmetric(horizontal: 26),
      child: AppBar(
        backgroundColor: AppColor.scaffoldBackgorundColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                Container(
                  padding: AppPadding.allSmall(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SvgPicture.asset(Assets.icon.inNotification),
                ),
                Positioned(
                  top: 6.0,
                  right: 6.0,
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.appRedColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: AppColor.appRedColor, size: 20.0),
                const SizedBox(width: 4.0),
                const Text(
                  'United State',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 20.0,
                ),
              ],
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.lightGreyColor),
            ),
            child: SvgPicture.asset(Assets.icon.icMenu),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
