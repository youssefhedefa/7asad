import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/result_part/result_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'المفضلة',
          background: ColorHelper.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=> const ResultItem(
            favoriteIcon: SizedBox(),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
