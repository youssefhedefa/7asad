import 'package:flutter/material.dart';
import 'widgets/custom_label.dart';
import 'widgets/offers_part/custom_offers_panel.dart';
import 'widgets/result_part/result_part.dart';
import 'widgets/section_part/section_part.dart';
import 'widgets/upper_part/upper_part.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperPart(),
              CustomLabel(
                label: 'عروض خاصة',
              ),
              CustomOffersPanel(),
              CustomLabel(
                label: 'الأقسام',
              ),
              SectionPart(),
              ResultPart(),
            ],
          ),
        ),
      ),
    );
  }
}
