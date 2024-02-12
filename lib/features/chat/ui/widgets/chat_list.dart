import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/chat/ui/widgets/chat_item.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => InkWell(
        onTap: (){
          Navigator.pushNamed(context, RoutesManager.chatBodyScreen);
        },
          child: const ChatItem(),
      ),
      separatorBuilder: (_, index) => const CustomDivider(
        rightPadding: 75,
        leftPadding: 28,
        verticalPadding: 4,
      ),
      itemCount: 15,
    );
  }
}
