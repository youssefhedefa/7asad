import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsDescription extends StatelessWidget {
  const ResultItemDetailsDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
        //'محصول سنه 2024 في ارض الواحات يلتزم المحصول بلمعايير الصحيحه',
        description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyleHelper.font14RegularDarkGreen,
    );
  }
}
