import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? side;
  final double? elevation;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;

  const CustomElevatedButton({
super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.side,
    this.elevation,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 47.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
     
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          padding: padding,
          elevation: elevation,
         
        ),
        child: child,
      ),
    );
  }
}