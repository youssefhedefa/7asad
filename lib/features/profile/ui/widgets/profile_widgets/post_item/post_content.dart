import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16,left: 16,bottom: 12),
      child: Text(
          ' اشتريت محصول قمح امبارح ازاي اعرف انو درجه اولى ',
        style: TextStyleHelper.font14RegularDarkGreen.copyWith(color: Colors.black),
      ),
    );
  }
}
