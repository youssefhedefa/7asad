
import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/alert_container.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/custom_label.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/custom_divider_with_label.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/medicien_list.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/samellier_images.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/taken_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/disease_detection/symptoms_disease.dart';

class DiseaseDetection extends StatelessWidget {
  const DiseaseDetection({super.key, required this.image});

  final XFile image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'كشف الأمراض',
        background: ColorHelper.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TakenImage(image: image),
              Row(
                children: [
                  Image.asset(
                      IconHelper.pointerIcon,
                    width: 14,
                    height: 21,
                  ),
                  const CustomLabel(
                      label: 'التشخيص',
                    rightPadding: 6,
                  ),
                ],
              ),
              Text(
                  ' مرض لفحة الغمد على الساق',
                style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                  fontWeight: FontWeightHelper.medium
                ),
              ),
              const CustomDividerWithLabel(
                text: 'أعراض المرض',
              ),
              const SymptomsOfTheDisease(),
              const SizedBox(height: 28,),
              const SamellierImage(),
              const CustomDividerWithLabel(text: 'العلاج'),
              const AlertContainer(
                text: 'يتم أستخدام نوع واحد فقط من الأنواع الأتيه وتتبع ارشادات الأستخدام الخاصه بكل نوع',
              ),
              const SizedBox(height: 28,),
              const MedicienList(),
              const CustomDividerWithLabel(text: 'الأسباب'),
              const SymptomsOfTheDisease(),
              const CustomDividerWithLabel(text: 'طرق الوقاية'),
              const SymptomsOfTheDisease(),
              const SizedBox(height: 28,),
            ],
          ),
        ),
      ),
    );
  }
}
