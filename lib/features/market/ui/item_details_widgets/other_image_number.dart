import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class OtherImageNumber extends StatelessWidget {
  const OtherImageNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.sizeOf(context).width - 100) / 4,
      width: (MediaQuery.sizeOf(context).width - 100) / 4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '+20',
        style: TextStyleHelper.font14RegularDarkGreen.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
