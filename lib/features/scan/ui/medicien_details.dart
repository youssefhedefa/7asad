import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/alert_container.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/custom_divider_with_label.dart';
import 'package:final_project/features/scan/ui/widgets/custom_stepper.dart';
import 'package:final_project/features/scan/ui/widgets/dose_calc.dart';
import 'package:final_project/features/scan/ui/widgets/safety_list.dart';
import 'package:flutter/material.dart';

class MedicienDetails extends StatelessWidget {
  const MedicienDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Megaban Super(MOL\\MIL)',
                  style: TextStyleHelper.font28BoldLightestGreen.copyWith(color: ColorHelper.darkestGreenColor),
                ),
                Text(
                  'مبيد حشري',
                  style: TextStyleHelper.font14RegularDarkestGreen,
                ),
                Center(
                  child: Image.asset(ImageHelper.testMedicienItemImage),
                ),
                const SizedBox(height: 28,),
                Row(
                  children: [
                    const CustomDividerWithLabel(
                        text: 'المادة الفعالة',
                      verticalPadding: 0,
                    ),
                    const Spacer(),
                    Text(
                        'Chlorpyrifos 50.0 EC',
                      style: TextStyleHelper.font16BoldDarkestGreen,
                    ),
                  ],
                ),
                const CustomDividerWithLabel(text: 'تعليمات الأستخدام'),
                const CustomStepper(
                    icon: IconHelper.knifeIcon,
                  text: 'لا تقم بيتطبيق اذا كنت ستقوم بلحصاد خلال 15 يوم بعد التطبيق لتقليل بقايا المبيدات الحشريه الغير أمنه على محصولك',
                ),
                const CustomStepper(
                  icon: IconHelper.dateIcon,
                  text: 'قم بتطبيقه مره واحده فقط',
                ),
                const CustomStepper(
                  icon: IconHelper.weatherIcon,
                  text: 'لا تستخدم هذا المنتج اذا كان الجو عاصفا أو ممطرا يجب تجنب التطبيق خلال الساعات الأكثر حرارة في اليوم',
                ),
                const CustomStepper(
                  icon: IconHelper.sprayIcon,
                  text: 'استخدام طريقة الرش في التطبيق',
                  isEnd: true,
                ),
                const CalculateDose(),
                const CustomDividerWithLabel(text: 'أحتياطات السلامة'),
                const SafetyList(),
                const AlertContainer(
                  text: 'المنتج شديد السمية يجب اتباع التعليمات بشده لتجنب اي ضرر',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
