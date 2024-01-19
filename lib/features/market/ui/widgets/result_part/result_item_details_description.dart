import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsDescription extends StatelessWidget {
  const ResultItemDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        'محصول سنه 2024 في ارض الواحات يلتزم المحصول بلمعايير الصحيحه',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyleHelper.font12RegularDarkGreen,
    );
  }
}
