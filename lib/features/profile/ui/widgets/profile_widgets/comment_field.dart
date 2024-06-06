import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentField extends StatelessWidget {
  const CommentField({super.key, required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(
          verticalPadding: 4,
          rightPadding: 0,
          leftPadding: 0,
        ),
        BlocConsumer<CommunityCubit, CommunityStates>(
            builder: (context, state) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context
                          .read<CommunityCubit>()
                          .commentController
                          .text
                          .isNotEmpty) {
                        context.read<CommunityCubit>().addComment(id: postId, text: context.read<CommunityCubit>().commentController.text);
                        context.read<CommunityCubit>().getCommentsPosts(id: postId);
                        context.read<CommunityCubit>().commentController.clear();

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'الرجاء كتابة تعليق',
                              style: TextStyleHelper.font14RegularDarkGreen,
                            ),
                            backgroundColor: ColorHelper.errorColor,
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorHelper.primaryColor,
                      ),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: context.read<CommunityCubit>().commentController,
                      decoration: InputDecoration(
                        border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'أكتب تعليقك.....',
                        hintStyle: TextStyleHelper.font14RegularDarkestGreen,
                      ),
                    ),
                  ),
                ],
              );
            },
            listener: (context,state) {
              if(state is SuccessAddComment){
                context.read<CommunityCubit>().getCommentsPosts(id: postId);
                context.read<CommunityCubit>().getAllPosts();
              }
            }
        ),
      ],
    );
  }
}
