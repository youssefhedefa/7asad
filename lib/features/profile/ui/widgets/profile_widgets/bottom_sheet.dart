import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/comment_field.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CommunityCubit>()..getCommentsPosts(id: id),
      child: BlocConsumer<CommunityCubit,CommunityStates>(
        builder: (context,state) {
          if(state is LoadingAllComments){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.only(
              top: 36,
              right: 16,
              left: 16,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'التعليقات',
                  style: TextStyleHelper.font16MediumDarkestGreen,
                ),
                const SizedBox(height: 22),
                context.read<CommunityCubit>().comments.isEmpty ? Expanded(
                  child: Center(
                    child: Text(
                      'لا يوجد تعليقات',
                      style: TextStyleHelper.font16RegularDarkestGreen,
                    ),
                  ),
                ) :
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CommunityCommentItem(
                      user: context.read<CommunityCubit>().comments[index].postedBy ?? defaultUser(),
                      content: context.read<CommunityCubit>().comments[index].text ?? '',
                    ),
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: context.read<CommunityCubit>().comments.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: CommentField(
                    postId: id,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context,state) {
          if(state is SuccessAddComment){
            context.read<CommunityCubit>().getCommentsPosts(id: id);
          }
        },
      ),
    );
  }
}
