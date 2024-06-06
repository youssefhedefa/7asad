import 'package:flutter/material.dart';

class ResultItemImage extends StatelessWidget {
  const ResultItemImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}
