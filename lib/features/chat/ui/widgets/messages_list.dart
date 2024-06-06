import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/features/chat/logic/providers/chat_provider.dart';
import 'package:final_project/features/chat/logic/providers/get_all_messages.dart';
import 'package:final_project/features/chat/ui/widgets/recevier_message.dart';
import 'package:final_project/features/chat/ui/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesList extends ConsumerWidget {
  const MessagesList({
    super.key,
    required this.chatroomId,
  });

  final String chatroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesList = ref.watch(getAllMessagesProvider(chatroomId));
    final myUid = CachHelper.getId();

    return messagesList.when(
      data: (messages) {
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages.elementAt(index);
            final isMyMessage = message.senderId == myUid;
            if (!isMyMessage) {
              ref.read(chatProvider).seenMessage(
                chatroomId: chatroomId,
                messageId: message.messageId,
              );
            }
            if (isMyMessage) {
              return SentMessage(message: message);
            } else {
              return ReceivedMessage(message: message,isMe: false,);
            }
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            error.toString(),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}