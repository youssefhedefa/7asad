import 'package:flutter/material.dart';
import 'custom_search_field.dart';
import 'filter_icon.dart';

class CustomSearchFieldRow extends StatelessWidget {
  const CustomSearchFieldRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: CustomSearchField(),
          ),
          SizedBox(width: 8),
          FilterIcon(
            height: 50,
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}