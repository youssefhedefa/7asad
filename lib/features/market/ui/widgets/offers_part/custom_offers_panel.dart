import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'custom_offer_card.dart';

class CustomOffersPanel extends StatefulWidget {
  const CustomOffersPanel({super.key});

  @override
  State<CustomOffersPanel> createState() => _CustomOffersPanelState();
}

class _CustomOffersPanelState extends State<CustomOffersPanel> {

  final PageController offerController = PageController();

  @override
  void initState() {
    super.initState();
    offerController.addListener(() {
      setState(() {
      });
    });
  }
  @override
  void dispose() {
    offerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.19,
            child: PageView.builder(
              controller: offerController,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(
                    left: 4,
                    right: 4,
                    top: 4,
                    bottom: 4,
                  ),
                  child: CustomOfferCard(),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          SmoothPageIndicator(
            effect: const ScrollingDotsEffect(
              spacing: 8,
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: ColorHelper.primaryColor,
            ),
            controller: offerController,
            count: 3,
          ),
        ],
      ),
    );
  }
}
