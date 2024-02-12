import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/chat/ui/widgets/footer/footer.dart';
import 'package:final_project/features/chat/ui/widgets/recevier_message.dart';
import 'package:final_project/features/chat/ui/widgets/send_message.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class ChatBodyScreen extends StatelessWidget {
  const ChatBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ابراهيم أحمد',
        background: Colors.white,
        radius: 0,
        hasLeading: true,
        hasImage: true,
        sufixWidget: MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.more_vert),
              //tooltip: 'Show menu',
            );
          },
          menuChildren: [
            MenuItemButton(
              child: Text(
                'مسح المحادثه         ',
                style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.regular),
              ),
            ),
            MenuItemButton(
              child: Text(
                'حظر',
                style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.regular),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const CustomDivider(
            verticalPadding: 0,
            leftPadding: 0,
            rightPadding: 0,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                reverse: true,
                itemBuilder: (_, index) {
                  if (index % 2 == 0) {
                    return const SendMessage();
                  } else {
                    return const RecevierMessage();
                  }
                },
                itemCount: 20,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const CustomFooter(),
        ],
      ),
    );
  }
}
