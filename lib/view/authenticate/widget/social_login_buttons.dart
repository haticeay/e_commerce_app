import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginIcons extends StatelessWidget {
  final VoidCallback? onGoogleSignIn;
  final VoidCallback? onFacebookSignIn;
  final VoidCallback? onAppleSignIn;
  final double iconSize;

  const SocialLoginIcons({
    super.key,
    this.onGoogleSignIn,
    this.onFacebookSignIn,
    this.onAppleSignIn,
    this.iconSize = 30.0,
  });

  Widget _buildIconButton({
    required String? iconPath,
    VoidCallback? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(color: AppColor.lightGreyColor, width: 2.0),
      ),
      width: iconSize + 65.w,
        child: IconButton(
          onPressed: onPressed,
          icon:
              iconPath != null
                  ? SvgPicture.asset(iconPath, width: iconSize, height: iconSize)
                  : const SizedBox.shrink(),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          if (onFacebookSignIn != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildIconButton(
              iconPath: Assets.icon.icFacebookSvg,
              onPressed: onFacebookSignIn,
            ),
          ),
        if (onGoogleSignIn != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildIconButton(
              iconPath: Assets.icon.icGoogleSvg,
              onPressed: onGoogleSignIn,
            ),
          ),
      
        if (onAppleSignIn != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildIconButton(
              iconPath: Assets.icon.icAppleSvg,
              onPressed: onAppleSignIn,
            ),
          ),
      ],
    );
  }
}
