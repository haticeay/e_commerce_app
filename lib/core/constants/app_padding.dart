import 'package:flutter/material.dart';
 
final class AppPadding extends EdgeInsets {
  // ignore: unused_element
  const AppPadding._() : super.all(0);
 
  const AppPadding.pagePadding() : super.fromLTRB(8, 8, 8, 40);
  const AppPadding.pageLargePadding() : super.fromLTRB(40, 32, 40, 32);
 
 
  const AppPadding.allSmall() : super.all(8);
  const AppPadding.allMedium() : super.all(16);
  const AppPadding.allLarge() : super.all(24);
 
  const AppPadding.horizontalSmall() : super.symmetric(horizontal: 8);
  const AppPadding.horizontalMedium() : super.symmetric(horizontal: 18);
  const AppPadding.horizontalLarge() : super.symmetric(horizontal: 20);
    const AppPadding.horizantalExtraLargePadding() : super.symmetric(horizontal: 24);
 
  const AppPadding.verticalSmall() : super.symmetric(vertical: 8);
  const AppPadding.verticalMedium() : super.symmetric(vertical: 16);
  const AppPadding.verticalLarge() : super.symmetric(vertical: 24);
    const AppPadding.verticalExtraExtraLarge() : super.symmetric(vertical: 40);
 
 
}