import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.verticalPadding, this.rightPadding, this.leftPadding});

  final double? verticalPadding;
  final double? rightPadding;
  final double? leftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top : verticalPadding?? 24,
        bottom : verticalPadding ?? 24,
        right: rightPadding ?? 0,
        left: leftPadding ?? 0,
      ),
      child:const Divider(
        height: 2,
        color: Color.fromRGBO(230, 224, 233, 1),
      ),
    );
  }
}
