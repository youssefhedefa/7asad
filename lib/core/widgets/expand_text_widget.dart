import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String firstLabel;
  final String firstDesc;
  final String? secondLabel;
  final String? secondDesc;
  final String? thirdLabel;
  final String? thirdDesc;

  const DescriptionTextWidget({super.key, required this.firstLabel, required this.firstDesc, this.secondLabel, this.secondDesc, this.thirdLabel, this.thirdDesc});

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {

     bool flag = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flag = !flag;
        });
      },
      child: Container(
        //padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: flag
            ? RichText(
            text: TextSpan(
              text: widget.firstLabel,
              style: TextStyleHelper.font16BoldDarkestGreen,
              children: [
                TextSpan(
                  text: widget.firstDesc,
                  style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                    fontWeight: FontWeightHelper.regular,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: '...أعرض اكثر',
                  style: TextStyleHelper.font12RegularPrimary.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),)
            : GestureDetector(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.firstLabel,
                        style: TextStyleHelper.font16BoldDarkestGreen,
                        children: [
                          TextSpan(
                            text:
                                widget.firstDesc,
                            style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                              fontWeight: FontWeightHelper.regular,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: widget.secondLabel,
                            style: TextStyleHelper.font16BoldDarkestGreen,
                          children: [
                            TextSpan(
                              text: widget.secondDesc!,
                              style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                                fontWeight: FontWeightHelper.regular,
                                height: 1.5,
                              ),
                            ),
                            TextSpan(
                              text: '...أعرض اقل',
                              style: TextStyleHelper.font12RegularPrimary.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ]
                        ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}