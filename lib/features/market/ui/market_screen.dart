
import 'package:flutter/material.dart';

import 'market_screen_widgets/custom_label.dart';
import 'market_screen_widgets/offers_part/custom_offers_panel.dart';
import 'market_screen_widgets/result_part/result_part.dart';
import 'market_screen_widgets/section_part/section_part.dart';
import 'market_screen_widgets/upper_part/app_bar/custom_market_app_bar.dart';
import 'market_screen_widgets/upper_part/upper_part.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomMarketAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperPart(),
              CustomLabel(label: 'عروض خاصة'),
              CustomOffersPanel(),
              CustomLabel(label: 'الأقسام'),
              SectionPart(),
              ResultPart(),
            ],
          ),
        ),
      ),
    );
  }
}
