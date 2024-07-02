import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class SymptomsOfTheDisease extends StatelessWidget {
  const SymptomsOfTheDisease({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      // child: const DescriptionTextWidget(
      //   firstLabel: '1.البقع الصفراء والبنية:',
      //   firstDesc: ' يمكن أن تظهر بقع صفراء أو بنية على أوراق النباتات المصابة. قد تكون هذه البقع غير منتظمة الشكل وتتزايد بحجمها مع مرور الوقتئ.',
      //   secondLabel: '2.التجعد والتشوه:',
      //   secondDesc: ' قد تكون أوراق النباتات المصابة متجعدة أو مشوهة. يمكن أن تكون الأوراق ملتوية أو متموجة بشكل غير طبيعي.',
      // ),
      child: Text(text, style: TextStyleHelper.font18MediumDarkestGreen),
    );
  }
}
