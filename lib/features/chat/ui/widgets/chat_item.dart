import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/chat/logic/providers/get_user_info_by_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItem extends ConsumerWidget {
  const ChatItem({super.key, required this.userId, required this.lastMessage, required this.lastMessageTs, required this.chatroomId});

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userInfo = ref.watch(UserDataService.getUserDataByIdProvider(userId));
    return userInfo.when(
        data: (userInfo){
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesManager.chatBodyScreen,
                arguments: ChatBodyModel(
                  name: userInfo.data!.user.name ?? 'اليوزر ملوش اسم',
                  id: userId,
                  image: userInfo.data!.user.photo ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQljYSrXL1AK2EzLXxKDtbl3hrFbLphwvqzmw&s',
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0,left: 32,bottom: 8,top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                           userInfo.data!.user.photo ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQljYSrXL1AK2EzLXxKDtbl3hrFbLphwvqzmw&s',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              userInfo.data!.user.name ?? 'اليوزر ملوش اسم',
                              style: TextStyleHelper.font18MediumDarkGreen,
                            ),
                            const Spacer(),
                            Text(
                              ' ${lastMessageTs.minute} : ${lastMessageTs.hour} ',
                              style: TextStyleHelper.font16RegularDarkestGreen,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleHelper.font12RegularDarkGreen.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     // const Icon(
                        //     //   //Icons.check,
                        //     //   Icons.done_all,
                        //     //   color: ColorHelper.successfulColor,
                        //     //   size: 18,
                        //     // ),
                        //     ,
                        //     // const SizedBox(width: 4),
                        //     // Container(
                        //     //   padding: const EdgeInsets.only(left: 7,right: 7,bottom: 7,top: 10),
                        //     //   decoration: const BoxDecoration(
                        //     //     shape: BoxShape.circle,
                        //     //     color: ColorHelper.primaryColor,
                        //     //   ),
                        //     //   child: Text(
                        //     //     '22',
                        //     //     textAlign: TextAlign.center,
                        //     //     style: TextStyleHelper.font12RegularBackground.copyWith(
                        //     //       fontWeight: FontWeightHelper.medium,
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
