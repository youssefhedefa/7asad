import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class CommentText extends StatelessWidget {
  const CommentText({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 140,
      child: ReadMoreText(
        comment,
        trimLines: 2,
        //colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'أقرا المزيد',
        trimExpandedText: 'أقرا اقل',
        style: TextStyleHelper.font14RegularDarkGreen,
        moreStyle: TextStyleHelper.font14MediumDarkestGreen,
        lessStyle: TextStyleHelper.font14MediumDarkestGreen,

      ),
    );
  }
}
