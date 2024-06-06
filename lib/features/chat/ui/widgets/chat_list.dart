//import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
//import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/chat/logic/providers/get_all_chats_provider.dart';
import 'package:final_project/features/chat/ui/widgets/chat_item.dart';
//import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ChatList extends StatelessWidget {
//   const ChatList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (_, index) => InkWell(
//         onTap: () {
//           Navigator.pushNamed(
//             context,
//             RoutesManager.chatBodyScreen,
//             arguments: ChatBodyModel(
//               name: '$index',
//               id: ' ',
//               image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQljYSrXL1AK2EzLXxKDtbl3hrFbLphwvqzmw&s',
//             ),
//           );
//         },
//         child: const ChatItem(),
//       ),
//       separatorBuilder: (_, index) => const CustomDivider(
//         rightPadding: 75,
//         leftPadding: 28,
//         verticalPadding: 4,
//       ),
//       itemCount: 15,
//     );
//   }
// }

class ChatsList extends ConsumerWidget {
  const ChatsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsList = ref.watch(getAllChatsProvider);
    final myUid = CachHelper.getId();
    return chatsList.when(
      data: (chats) {
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats.elementAt(index);
            final userId = chat.members.firstWhere((userId) => userId != myUid);
            return ChatItem(
              userId: userId,
              lastMessage: chat.lastMessage,
              lastMessageTs: chat.lastMessageTs,
              chatroomId: chat.chatroomId,
            );
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