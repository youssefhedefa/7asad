import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.verticalPadding});

  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding?? 24),
      child:const Divider(
        height: 2,
        color: Color.fromRGBO(230, 224, 233, 1),
      ),
    );
  }
}
