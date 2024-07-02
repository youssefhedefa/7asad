import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_flash_dot.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/person_button.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key,required this.consultant});

  final User consultant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
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
                  // const Spacer(),
                  // MenuAnchor(
                  //   builder: (BuildContext context, MenuController controller,
                  //       Widget? child) {
                  //     return IconButton(
                  //       onPressed: () {
                  //         if (controller.isOpen) {
                  //           controller.close();
                  //         } else {
                  //           controller.open();
                  //         }
                  //       },
                  //       icon: const Icon(Icons.more_vert),
                  //       //tooltip: 'Show menu',
                  //     );
                  //   },
                  //   menuChildren: const [
                  //     SizedBox(),
                  //     SizedBox(),
                  //   ],
                  // ),
                ],
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'الاستشاري: ',
                  style: TextStyleHelper.font12MediumDarkestGreen,
                  children: [
                    TextSpan(
                      text: consultant.name,
                      style: TextStyleHelper.font12MediumDarkestGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // RichText(
              //   text: TextSpan(
              //     text: 'العلاج: ',
              //     style: TextStyleHelper.font12MediumDarkestGreen,
              //     children: [
              //       TextSpan(
              //         text: 'Megaban Super(MOL\\MIL)',
              //         style: TextStyleHelper.font12MediumDarkestGreen,
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.profileScreen,
                        arguments: DataToProfileAsVisitor(
                          isVisitor: (consultant.id != CachHelper.getId()),
                          id: consultant.id,
                        ),
                      );
                    },
                    child: PersonButton(
                      consultant: consultant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Row(
            children: [
              CustomFlashDot(),
              SizedBox(width: 4),
              // Text(
              //   'الأن',
              //   style: TextStyleHelper.font10RegularDarkestGreen
              //       .copyWith(color: ColorHelper.errorColor),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
