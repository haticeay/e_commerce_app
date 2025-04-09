import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/core/constants/app_color.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation; // OutlinedButton'da genellikle 0 veya çok düşüktür

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 47.0.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColor.lightPrimaryColor,
          textStyle: textStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: padding,
          side: BorderSide.none,
          elevation: elevation,
        ),
        child: child,
      ),
    );
  }
}
