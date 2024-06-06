import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:final_project/features/community/ui/widgets/community_screen_app_bar.dart';
import 'package:final_project/features/community/ui/widgets/post_item/post_item.dart';
import 'package:final_project/features/community/ui/widgets/post_publisher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CommunityCubit>()..getAllPosts(),
      child: Scaffold(
        appBar: const CommunityScreenAppBar(),
        body: BlocBuilder<CommunityCubit,CommunityStates>(
          builder: (context,state) {
            if(state is LoadingAllPosts){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: PostPublisher(),
                ),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    return PostItem(
                      postId: context.read<CommunityCubit>().posts[index].id ?? '',
                      publisher: context.read<CommunityCubit>().posts[index].postedBy ?? defaultUser(),
                      content: context.read<CommunityCubit>().posts[index].content ?? ' ',
                      image: context.read<CommunityCubit>().posts[index].image ?? 'no',
                      likesList: context.read<CommunityCubit>().posts[index].likes,
                      comments: context.read<CommunityCubit>().posts[index].comments.length,
                      time: context.read<CommunityCubit>().posts[index].date.toString(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: context.read<CommunityCubit>().posts.length,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}


