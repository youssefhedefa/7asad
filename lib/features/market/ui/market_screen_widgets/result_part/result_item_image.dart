import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class ResultItemImage extends StatelessWidget {
  const ResultItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
            image: AssetImage(
              ImageHelper.orangeImage,
            ),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}
