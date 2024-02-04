import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'لدينا للبيع محصول قمح ذو جودة عالية وممتازة. يتمزَّر القمح باللون الذهبي الجميل ويتمتع بحبوب كبيرة وممتلئة. يتم زراعة هذا المحصول باستخدام أفضل الممارسات الزراعية وبدون استخدام المبيدات الحشرية الضارة. يتم حصاد القمح في وقته المناسب ',
      style: TextStyleHelper.font14RegularDarkGreen,
    );
  }
}
