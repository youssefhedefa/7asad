import 'package:flutter/material.dart';

class OtherImageItem extends StatelessWidget {
  const OtherImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.sizeOf(context).width - 100) / 4,
      width: (MediaQuery.sizeOf(context).width - 100) / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
