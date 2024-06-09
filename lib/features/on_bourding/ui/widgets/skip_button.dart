import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.signInScreen);
          },
          child: Text(
            'تخطي',
            style: TextStyleHelper.font16MediumPrimary,
          ),
        ),
      ],
    );
  }
}
