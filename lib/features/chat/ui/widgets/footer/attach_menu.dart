import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_functions/functions.dart';
import 'package:final_project/features/chat/logic/providers/chat_provider.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_or_send_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttachMenu extends ConsumerWidget {
  const AttachMenu({super.key,required this.chatroomId, required this.userId});

  final String chatroomId;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return AttachAndSendIcon(
          isAttach: true,
          onAttachTap: () {
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
          onPressed: () async {
            final image = await pickImageFromGallery();
            if (image == null) return;
            await ref.read(chatProvider).sendFileMessage(
                  file: image,
                  chatroomId: chatroomId,
                  receiverId: userId,
                  messageType: 'image',
                );
          },
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
        const SizedBox(
          height: 4,
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
