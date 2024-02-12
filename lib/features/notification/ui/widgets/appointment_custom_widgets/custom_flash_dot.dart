import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class CustomFlashDot extends StatefulWidget {
  const CustomFlashDot({super.key});

  @override
  State<CustomFlashDot> createState() => _CustomFlashDotState();
}

class _CustomFlashDotState extends State<CustomFlashDot> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.6, end: 1.0).animate(_controller),
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: ColorHelper.errorColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
