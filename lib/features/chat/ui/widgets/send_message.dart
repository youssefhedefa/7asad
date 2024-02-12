import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/triangle_painter.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomPaint(
          painter: TrianglePainter(
            color: ColorHelper.primaryColor
          ),
          size: const Size(10, 12),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.8,
          ),
          decoration: const BoxDecoration(
            color: ColorHelper.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(21),
              topRight: Radius.circular(21),
              topLeft: Radius.circular(21),
            ),
          ),
          child: Column(
            children: [
              Text(
                  'مرحبا نا داحمد اسماعيل من الشرقيةمرحبا نا داحمد اسماعيل من الشرقيةمرحبا نا داحمد اسماعيل من الشرقيةمرحبا نا داحمد اسماعيل من الشرقية ',
                style: TextStyleHelper.font18MediumWhite,

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                      Icons.done_all,
                    color: ColorHelper.successfulColor,
                    size: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0,right: 6),
                    child: Text(
                        '3.12 ص',
                      style: TextStyleHelper.font12RegularDarkGreen.copyWith(
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
