import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/bottom_sheet.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/iteraction_button.dart';
import 'package:flutter/material.dart';

class InteractionButtonsRow extends StatefulWidget {
  const InteractionButtonsRow({super.key});

  @override
  State<InteractionButtonsRow> createState() => _InteractionButtonsRowState();
}

class _InteractionButtonsRowState extends State<InteractionButtonsRow> {
  IconData favoriteIcon = Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InteractionButton(
          icon: Image.asset(
            IconHelper.sendIcon,
            height: 28,
            width: 28,
          ),
          label: 'ارسال',
        ),
        InteractionButton(
          icon: Image.asset(
            IconHelper.shareIcon,
            height: 28,
            width: 28,
          ),
          label: 'مشاركة',
        ),
        InteractionButton(
          icon: const Icon(
            Icons.comment_outlined,
            color: ColorHelper.darkGreenColor,
            size: 28,
          ),
          label: 'تعليق',
          onTap: (){
            showBottomSheet();
          },
        ),
        InteractionButton(
          icon: Icon(
            favoriteIcon,
            color: ColorHelper.darkGreenColor,
            size: 28,
          ),
          label: 'اعجبني',
          onTap: () {
            setState(() {
              if (favoriteIcon != Icons.favorite) {
                favoriteIcon = Icons.favorite;
              }
              else {
                favoriteIcon = Icons.favorite_outline;
              }
            });
          },
        ),
      ],
    );
  }

  void showBottomSheet(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return const CustomBottomSheet();
      },
    );
  }

}
