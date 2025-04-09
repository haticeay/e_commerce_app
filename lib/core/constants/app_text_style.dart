import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heraninda/core/constants/app_color.dart';

class AppTextStyle {
  static TextStyle instrumentSansRegular(context) => GoogleFonts.instrumentSans(
    
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColor.defaultTextColor
  );
  static TextStyle instrumentSansMedium(context) => GoogleFonts.instrumentSans(
    
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColor.defaultTextColor
  );
}