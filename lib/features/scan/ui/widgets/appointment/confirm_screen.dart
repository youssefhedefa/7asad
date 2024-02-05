import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 60,),
              Expanded(
                flex: 4,
                  child: Image.asset(ImageHelper.confirmImage,),
              ),
              const SizedBox(height: 50,),
              Expanded(
                flex: 4,
                  child: Column(
                    children: [
                      Text(
                          'تم حجز معادك بنجاح ',
                        style: TextStyleHelper.font28BoldLightestGreen.copyWith(
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 18,),
                      Container(
                        width: MediaQuery.sizeOf(context).width - 60,
                        padding: const EdgeInsets.symmetric(horizontal: 44,vertical: 19),
                        decoration: BoxDecoration(
                          color: ColorHelper.lightGreenColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                         '''
معادك مع د\\ احمد علي,
يوم الثلاثاء,10مارس2024
في تمام الساعة 3:30 الى 4 مساءا
                         ''',
                          style: TextStyleHelper.font16MediumDarkGreen,
                        ),
                      ),
                    ],
                  ),
              ),
              const Spacer(
                flex: 2,
              ),
              ActionButton(
                onTap: (){
                },
                label: 'تأكيد ',
                outerColor: ColorHelper.primaryColor,
                labelColor: Colors.white,
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
