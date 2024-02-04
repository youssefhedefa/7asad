import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';
import 'result_item.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ResultItem(
        favoriteIcon: Positioned(
          left: -10,
          top: -10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: ColorHelper.errorColor,
            ),
          ),
        ),
      ),
      itemCount: 10,
    );
  }
}
