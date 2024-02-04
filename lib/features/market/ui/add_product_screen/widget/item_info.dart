import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key, required this.label, this.height, this.keyBordTyp, required this.isMultiLine});

  final String label;
  final double? height;
  final TextInputType? keyBordTyp;
  final bool isMultiLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyleHelper.font16BoldDarkestGreen
                .copyWith(fontWeight: FontWeightHelper.medium),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: height,
            child: TextField(
              maxLines: isMultiLine ? null : 1,
              minLines: 1,
              keyboardType: keyBordTyp ?? TextInputType.text,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xffCFD9D8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
