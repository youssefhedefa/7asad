import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key, required this.onTap, required this.sign, required this.outerColor, required this.textColor, required this.width, required this.height, this.buttonFontSize});

  final void Function() onTap;
  final String sign;
  final Color outerColor;
  final Color textColor;
  final double width;
  final double height;
  final double? buttonFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          sign,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: buttonFontSize ?? 14,
          ),
        ),
      ),
    );
  }
}
