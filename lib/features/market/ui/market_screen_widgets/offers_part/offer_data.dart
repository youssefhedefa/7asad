import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/offers_part/description_text.dart';
import 'package:flutter/material.dart';


class OfferData extends StatelessWidget {
  const OfferData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                ImageHelper.wheatImage,
              ),
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
              right: 16,
              left: 18,
              top: 24,
            ),
            width: MediaQuery.sizeOf(context).width * 0.68,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  const Color(0xff414141).withOpacity(0.7),
                  Colors.black.withOpacity(0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                  ),
                  child: Text(
                    '2 طن قمح خبز ',
                    style: TextStyleHelper.font22MediumWhite,
                  ),
                ),
                const DescriptionText(),
              ],
            )
        ),
      ],
    );
  }
}
