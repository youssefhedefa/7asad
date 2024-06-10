import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/custom_functions/functions.dart';
import 'package:final_project/features/chat/logic/controller/audio_recorder/audio_recorder_controller.dart';
import 'package:final_project/features/chat/logic/controller/audio_recorder/audio_recorder_file_helper.dart';
import 'package:final_project/features/chat/logic/providers/chat_provider.dart';
import 'package:final_project/features/chat/ui/widgets/audio_recorde/audio_record.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_menu.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_or_send_icon.dart';
import 'package:final_project/features/chat/ui/widgets/footer/custom_icons.dart';
import 'package:final_project/features/chat/ui/widgets/footer/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFooter extends ConsumerStatefulWidget {
  const CustomFooter({super.key,required this.chatroomId, required this.receiverId});

  final String chatroomId;
  final String receiverId;

  @override
  ConsumerState<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends ConsumerState<CustomFooter> {



  TextEditingController messageController = TextEditingController();
  bool isMicAndCamera = true;
  bool isMicOpen = false;
  bool isPause = false;

  handelMic(){
    setState(() {
      isMicOpen = !isMicOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isMicOpen ?
    RepositoryProvider(
      create: (context) => AudioRecorderController(
        AudioRecorderFileHelper(),
        (message) {
          print(message);
        },
      ),
      child: Container(
        color: ColorHelper.primaryColor,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(top: 14, left: 14,right: 14,bottom: 18),
        child: AudioRecorderViewBody(
          onGestureTap: handelMic,
          roomID: widget.chatroomId,
          receiverId: widget.receiverId,
        ),
      ),
    ):
    Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(top: 14, left: 14, bottom: 18),
      decoration: const BoxDecoration(
        color: ColorHelper.medGreenColor,
      ),
      child: Row(
        children: [
          const SizedBox(width: 6),
          isMicAndCamera
              ? MicAndCameraIcons(
            onMicTap: () async {
               setState(() {
                  isMicOpen = true;
               });
            },
            onCameraTap: () async {
              final image = await pickImageFromCamera();
              if (image == null) return;
              await ref.read(chatProvider).sendFileMessage(
                file: image,
                chatroomId: widget.chatroomId,
                receiverId: widget.receiverId,
                messageType: 'image',
              );
            },
          )
              : AttachAndSendIcon(
            isAttach: false,
            onSendTap: () async {
              if (messageController.text.isNotEmpty) {
                await ref.read(chatProvider).sendMessage(
                  chatroomId: widget.chatroomId,
                  message: messageController.text,
                  receiverId: widget.receiverId,
                );
                messageController.clear();
              }
            },
          ),
          const SizedBox(width: 8),
          CustomTextField(
            controller: messageController,
            onTap: () {
              if (messageController.text.isNotEmpty) {
                setState(() {
                  isMicAndCamera = false;
                });
              } else {
                setState(() {
                  isMicAndCamera = true;
                });
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isMicAndCamera = false;
                });
              } else {
                setState(() {
                  isMicAndCamera = true;
                });
              }
            },
            onSubmitted: (value) async {
              if (value.isNotEmpty) {
                await ref.read(chatProvider).sendMessage(
                  chatroomId: widget.chatroomId,
                  message: value,
                  receiverId: widget.receiverId,
                );
                messageController.clear();
              }
            },
          ),
          const SizedBox(width: 8),
          AttachMenu(
            chatroomId: widget.chatroomId,
            userId: widget.receiverId,
          ),
        ],
      ),
    );
  }
}