import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class MainItemDetailsImage extends StatelessWidget {
  const MainItemDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageHelper.testMainItemDetailsImage),
        ),
      ),
    );
  }
}
