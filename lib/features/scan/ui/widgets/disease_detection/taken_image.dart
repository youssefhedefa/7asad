import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakenImage extends StatelessWidget {
  const TakenImage({super.key,
    required this.image
  });

  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.28,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: FileImage(
             //ImageHelper.testMainItemDetailsImage,
              File(image.path),
          ),
        ),
      ),
    );
  }
}
