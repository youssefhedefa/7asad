import 'package:flutter/material.dart';
import 'custom_search_field.dart';
import 'filter_icon.dart';

class CustomSearchFieldRow extends StatelessWidget {
  const CustomSearchFieldRow({super.key, required this.enabled, this.controller, this.onChanged});

  final bool enabled;
  final TextEditingController? controller;
  final void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: CustomSearchField(
              enabled: enabled,
              onChanged: onChanged,
              controller: controller,
            ),
          ),
          const SizedBox(width: 8),
          const FilterIcon(
            height: 50,
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}