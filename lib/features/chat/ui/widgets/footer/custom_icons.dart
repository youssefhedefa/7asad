import 'package:flutter/material.dart';

class MicAndCameraIcons extends StatelessWidget {
  const MicAndCameraIcons({super.key, this.onMicTap, this.onCameraTap});

  final void Function()? onMicTap;
  final void Function()? onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onMicTap,
          child: const SizedBox(
            width: 34,
            height: 34,
            child: Icon(
              Icons.keyboard_voice_outlined,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: onCameraTap,
          child: const SizedBox(
            width: 34,
            height: 34,
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
