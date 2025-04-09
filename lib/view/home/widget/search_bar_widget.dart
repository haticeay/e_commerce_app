import 'package:flutter/material.dart';
import 'package:heraninda/assets.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_strings.dart'; 
import 'package:svg_flutter/svg.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final VoidCallback? onFilterTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchTap;

  const SearchBarWidget({
    super.key,
    this.hintText = AppStrings.searchDestinationsHint, 
    this.onFilterTap,
    this.controller,
    this.onChanged,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.filledColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onTap: onSearchTap,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColor.filledColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SvgPicture.asset(Assets.icon.icScanner),
            ),
          ),
        ],
      ),
    );
  }
}