import 'package:flutter/material.dart';

class SamellierImage extends StatelessWidget {
  const SamellierImage({super.key, required this.similarImages});

  final List<dynamic> similarImages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Image.asset(
            similarImages[index],
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8,),
        itemCount: similarImages.length,
      ),
    );
  }
}
