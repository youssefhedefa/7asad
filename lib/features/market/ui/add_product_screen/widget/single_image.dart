import 'dart:io';
import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SingleImage extends StatefulWidget {
  const SingleImage({super.key});

  @override
  State<SingleImage> createState() => _SingleImageState();
}

class _SingleImageState extends State<SingleImage> {

  List<XFile>? _imageFiles = [];
  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        _imageFiles = images;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC),
          borderRadius: BorderRadius.circular(4),
        ),
        child: _imageFiles != null && _imageFiles!.isNotEmpty
            ? Image.file(
          fit: BoxFit.fill,
                File(
                  _imageFiles![0].path,
                ),
              )
            : Image.asset(IconHelper.addImageIcon),
      ),
    );
  }
}
