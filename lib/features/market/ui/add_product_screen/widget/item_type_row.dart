import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/custom_check_button.dart';
import 'package:flutter/material.dart';


class ItemTypeRow extends StatelessWidget {
  const ItemTypeRow({super.key, required this.label, required this.icon, required this.selected});

  final String label;
  final String icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
         top: 8.0,
        left: 16,
        right: 16
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                shadows: const [
                   BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset(icon),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                fontWeight: FontWeightHelper.regular
              ),
            ),
            const Spacer(),
            CustomCheckButton(
              selected: selected,
            ),
          ],
        ),
      ),
    );
  }
}
