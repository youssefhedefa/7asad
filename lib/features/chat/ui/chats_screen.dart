import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/chat/ui/widgets/chat_list.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/custom_search/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المحادثات',
        background: ColorHelper.primaryColor,
        radius: 0,
        sufixWidget: SizedBox(),
        hasImage: false,
        hasLeading: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: ColorHelper.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: const SizedBox(
              height: 50,
                child: CustomSearchField(
                  enabled: true,
                ),
            ),
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: ChatsList(),
          ),
        ],
      ),
    );
  }
}
