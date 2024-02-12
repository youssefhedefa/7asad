import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/triangle_painter.dart';
import 'package:flutter/material.dart';

class RecevierMessage extends StatelessWidget {
  const RecevierMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.8,
          ),
          decoration: const BoxDecoration(
            color: ColorHelper.darkGreenColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(21),
              topRight: Radius.circular(21),
              topLeft: Radius.circular(21),
            ),
          ),
          child: Column(
            children: [
              Text(
                'مرحبا نا داحمد اسماعيل من الشرقية مرحبا نا داحمد اسماعيل من الشرق ',
                style: TextStyleHelper.font18MediumWhite,

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0,left: 6),
                    child: Text(
                      '3.12 ص',
                      style: TextStyleHelper.font12RegularDarkGreen.copyWith(
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.done_all,
                    color: ColorHelper.successfulColor,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Transform.rotate(
            angle: 3.5 * (22/7),
            alignment: Alignment.bottomRight,
            transformHitTests: false,
            child: CustomPaint(
              painter: TrianglePainter(
                color: ColorHelper.darkGreenColor
              ),
              size: const Size(10, 12),
            ),
          ),
        ),
      ],
    );
  }
}
