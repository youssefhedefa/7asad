import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:final_project/features/community/ui/widgets/post_item/iteraction_button.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InteractionButtonsRow extends StatelessWidget {
  const InteractionButtonsRow({super.key, required this.postId, required this.likes});

  final String postId;
  final List<dynamic> likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InteractionButton(
          icon: Image.asset(
            IconHelper.shareIcon,
            height: 28,
            width: 28,
          ),
          label: 'مشاركة',
        ),
        InteractionButton(
          icon: const Icon(
            Icons.comment_outlined,
            color: ColorHelper.darkGreenColor,
            size: 28,
          ),
          label: 'تعليق',
          onTap: (){
            showBottomSheet(
              id: postId,
              context: context,
            );
          },
        ),
        BlocBuilder<CommunityCubit,CommunityStates>(
          builder: (context,state) {
            if(state is LoadingLikePost || state is LoadingUnlikePost){
              return const InteractionButton(
                icon: Icon(
                  Icons.waving_hand,
                  color: ColorHelper.darkGreenColor,
                  size: 28,
                ),
                label: 'اعجبني',
              );
            }
            return InteractionButton(
              icon: Icon(
                likes.contains(CachHelper.getId()) ? Icons.favorite : Icons.favorite_outline,
                color: ColorHelper.darkGreenColor,
                size: 28,
              ),
              label: 'اعجبني',
              onTap: () {
                if(!likes.contains(CachHelper.getId())){
                  context.read<CommunityCubit>().likePost(
                    id: postId,
                  );
                }
                else{
                  context.read<CommunityCubit>().unlikePost(
                    id: postId,
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }

  void showBottomSheet({ required String id , required BuildContext context}){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          id: id,
        );
      },
    );
  }

}
