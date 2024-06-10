import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/chat/logic/providers/chat_provider.dart';
import 'package:final_project/features/chat/ui/widgets/footer/footer.dart';
import 'package:final_project/features/chat/ui/widgets/messages_list.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ChatBodyScreen extends ConsumerStatefulWidget {
  const ChatBodyScreen({super.key, required this.chatModel});

  final ChatBodyModel chatModel;

  @override
  ConsumerState<ChatBodyScreen> createState() => _ChatBodyScreenState();
}

class _ChatBodyScreenState extends ConsumerState<ChatBodyScreen> {

  late final TextEditingController messageController;
  late final String chatroomId;

  final record = FlutterSoundRecorder();

  bool isMicAndCamera = true;
  bool isMicOpen = false;
  bool isPause = false;

  @override
  void initState() {
    messageController = TextEditingController();
    messageController.addListener(() {
      if (messageController.text.isNotEmpty) {
        setState(() {
          isMicAndCamera = false;
        });
      } else {
        setState(() {
          isMicAndCamera = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.chatModel.name,
        background: Colors.white,
        radius: 0,
        hasLeading: true,
        hasImage: true,
        userImage: widget.chatModel.image,
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
      body: FutureBuilder(
        future: ref.watch(chatProvider).createChatroom(userId: widget.chatModel.id),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          chatroomId = snapshot.data ?? 'No chatroom Id';
          return Column(
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
                  child: MessagesList(chatroomId: chatroomId),
                ),
              ),
              const SizedBox(height: 8),
              //_buildMessageInput(),
              CustomFooter(
                chatroomId: chatroomId,
                receiverId: widget.chatModel.id,
              ),
            ],
          );
        }
      ),
    );
  }
}
