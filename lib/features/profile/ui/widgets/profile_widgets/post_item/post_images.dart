import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class PostImages extends StatelessWidget {
  const PostImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SizedBox(
            height: 250,
            child: Image.asset(
              ImageHelper.wheatImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    ImageHelper.wheatImage,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Image.asset(
                    ImageHelper.wheatImage,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        ImageHelper.wheatImage,
                        fit: BoxFit.fill,
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 34,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
