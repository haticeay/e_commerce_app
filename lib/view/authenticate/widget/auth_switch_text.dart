import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_text_style.dart';

class AuthSwitchText extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onSecondaryTap;
  final TextStyle? primaryTextStyle;
  final TextStyle? secondaryTextStyle;

  const AuthSwitchText({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.onSecondaryTap,
    this.primaryTextStyle,
    this.secondaryTextStyle,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          primaryText,
          style: AppTextStyle.instrumentSansRegular(context),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: onSecondaryTap,
          child: Text(
            secondaryText,
            style: AppTextStyle.instrumentSansRegular(context).copyWith(
              color: AppColor.primaryColor
            ),
          ),
        ),
      ],
    );
  }
}