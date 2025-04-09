import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';

class FilterBarWidget extends StatefulWidget {
  final List<String> filters;
  final ValueChanged<String> onFilterSelected;
  final String? initialSelectedFilter;

  const FilterBarWidget({
    super.key,
    required this.filters,
    required this.onFilterSelected,
    this.initialSelectedFilter,
  });

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  String? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialSelectedFilter ?? widget.filters.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: widget.filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
              showCheckmark: false,
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  _selectedFilter = selected ? filter : null;
                });
                widget.onFilterSelected(filter);
              },
              backgroundColor: Colors.grey.shade200,
              selectedColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(
                color: isSelected ? Colors.transparent : Colors.grey.shade300,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}