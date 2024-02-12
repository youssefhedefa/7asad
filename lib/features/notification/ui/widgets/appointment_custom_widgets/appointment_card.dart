import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_flash_dot.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/person_button.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          //width: MediaQuery.sizeOf(context).width * 0.70,
          padding: const EdgeInsets.only(
            bottom: 20,
            top: 16,
            left: 10,
            right: 24,
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(8),
            color: ColorHelper.cardBackgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'أستشارة مرضية',
                    style: TextStyleHelper.font16BoldDarkestGreen,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'عن: الارز',
                    style: TextStyleHelper.font12MediumDarkestGreen,
                  ),
                  const Spacer(),
                  MenuAnchor(
                    builder: (BuildContext context, MenuController controller,
                        Widget? child) {
                      return IconButton(
                        onPressed: () {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                        icon: const Icon(Icons.more_vert),
                        //tooltip: 'Show menu',
                      );
                    },
                    menuChildren: const [
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'التشخيص: ',
                  style: TextStyleHelper.font12MediumDarkestGreen,
                  children: [
                    TextSpan(
                      text: 'هاموشة الأرز',
                      style: TextStyleHelper.font12MediumDarkestGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'العلاج: ',
                  style: TextStyleHelper.font12MediumDarkestGreen,
                  children: [
                    TextSpan(
                      text: 'Megaban Super(MOL\\MIL)',
                      style: TextStyleHelper.font12MediumDarkestGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PersonButton(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Row(
            children: [
              const CustomFlashDot(),
              const SizedBox(width: 4),
              Text(
                'الأن',
                style: TextStyleHelper.font10RegularDarkestGreen
                    .copyWith(color: ColorHelper.errorColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
