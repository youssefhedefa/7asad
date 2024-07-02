import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/custom_label.dart';
import 'package:final_project/features/scan/data/models/diseases_info.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/custom_divider_with_label.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/samellier_images.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/taken_image.dart';
import 'package:flutter/material.dart';
import 'widgets/disease_detection/symptoms_disease.dart';

class DiseaseDetection extends StatelessWidget {
  const DiseaseDetection({super.key, required this.diseaseInfoModel});

  //final XFile image;
  final DiseaseInfoModel diseaseInfoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'كشف الأمراض',
        background: Colors.white,
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
              TakenImage(
                  image: diseaseInfoModel.image,
              ),
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
                    hasViewAll: false,
                  ),
                ],
              ),
              Text(
                diseaseInfoModel.diseaseName,
                style: TextStyleHelper.font16BoldDarkestGreen
                    .copyWith(fontWeight: FontWeightHelper.medium),
              ),
              //const CustomDivider(),
              const CustomDividerWithLabel(text: 'صور مشابهه'),
              SamellierImage(
                similarImages: diseaseInfoModel.similarImages,
              ),
              const CustomDividerWithLabel(
                text: 'أعراض المرض',
              ),
              SymptomsOfTheDisease(
                  text: diseaseInfoModel.description
              ),
              const SizedBox(
                height: 28,
              ),
              const CustomDividerWithLabel(text: 'الأسباب'),
              SymptomsOfTheDisease(
                text:  diseaseInfoModel.factors,
              ),
              const SizedBox(
                height: 28,
              ),
              const CustomDividerWithLabel(text: 'العلاج'),
              // const AlertContainer(
              //   text:
              //       'يتم أستخدام نوع واحد فقط من الأنواع الأتيه وتتبع ارشادات الأستخدام الخاصه بكل نوع',
              // ),
              // const SizedBox(
              //   height: 28,
              // ),
              // const MedicienList(),
              const SizedBox(
                height: 28,
              ),
              SymptomsOfTheDisease(
                text:  diseaseInfoModel.chemicalCombat,
              ),
              const CustomDividerWithLabel(text: 'طرق الوقاية'),
              SymptomsOfTheDisease(
                text:  diseaseInfoModel.defaultCombat,
              ),
              const SizedBox(
                height: 28,
              ),
              const CustomDivider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: const Color(0xffDAF2EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'هل كان التشخيص والعلاج مفيد؟',
                      style: TextStyleHelper.font16BoldDarkestGreen,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'يمكنك حجز معاد مع أحد مستشارين الأمراض والتحدث معه بشكل مباشر للتأكد من الحاله ',
                      style: TextStyleHelper.font16BoldDarkestGreen
                          .copyWith(fontWeight: FontWeightHelper.regular),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width - 120,
                        child: ActionButton(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesManager.bookingScreen);
                          },
                          label: 'احجز معاد',
                          outerColor: ColorHelper.primaryColor,
                          labelColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28,)
            ],
          ),
        ),
      ),
    );
  }
}
