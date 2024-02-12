import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_or_send_icon.dart';
import 'package:flutter/material.dart';

class AttachMenu extends StatelessWidget {
  const AttachMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return AttachAndSendIcon(
          isAttach: true,
          onAttachTap: (){
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
      menuChildren: [
        MenuItemButton(
          child: Row(
            children: [
              const Icon(
                Icons.add_photo_alternate_outlined,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                'صوره',
                style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.regular),
              ),
              const SizedBox(width: 38),
            ],
          ),
        ),
        MenuItemButton(
          child: Row(
            children: [
              const Icon(
                  Icons.insert_drive_file_outlined,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                'ملف',
                style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                    color: Colors.black, fontWeight: FontWeightHelper.regular),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
