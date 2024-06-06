import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:final_project/features/community/ui/widgets/profile_image_network_cach.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/app_bar/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PostPublisher extends StatelessWidget {
  const PostPublisher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 8,
        end: 12,
        top: 12,
        bottom: 14,
      ),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorHelper.cardBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(1, 3),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        builder: (context, state) {
          if (state is LoadingAddPost) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Row(
                children: [
                  const ProfileImage(),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: context.read<CommunityCubit>().postController,
                      decoration: InputDecoration(
                        hintText: 'أكتب منشورك',
                        hintStyle: TextStyleHelper.font16RegularDarkGreen,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              addImageToPost(
                  context: context,
                  image: context.read<CommunityCubit>().imageUrl),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CustomIcon(
                    icon: Icons.image_outlined,
                    borderColor: Colors.transparent,
                    iconColor: ColorHelper.darkGreenColor,
                    size: 34,
                    onTap: () async {
                      await context
                          .read<CommunityCubit>()
                          .pickImage(source: ImageSource.gallery);
                      if (context.mounted) {
                        if (context.read<CommunityCubit>().imageXFile != null) {
                          context.read<CommunityCubit>().uploadImage();
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomIcon(
                    icon: Icons.camera_alt_outlined,
                    borderColor: Colors.transparent,
                    iconColor: ColorHelper.darkGreenColor,
                    size: 34,
                    onTap: () async {
                      await context
                          .read<CommunityCubit>()
                          .pickImage(source: ImageSource.camera);
                      if (context.mounted) {
                        if (context.read<CommunityCubit>().imageXFile != null) {
                          context.read<CommunityCubit>().uploadImage();
                        }
                      }
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (context
                          .read<CommunityCubit>()
                          .postController
                          .text
                          .isNotEmpty || context
                              .read<CommunityCubit>()
                              .imageUrl
                              .isNotEmpty) {
                        context.read<CommunityCubit>().addPost(
                            text: context
                                .read<CommunityCubit>()
                                .postController
                                .text,
                            image: context.read<CommunityCubit>().imageUrl
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('المنشور لا يمكن أن يكون فارغاً'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorHelper.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'نشر',
                      style: TextStyleHelper.font16MediumWhite,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is LoadingAddPost) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                ),
              ),
            );
          }
          if (state is SuccessAddPost) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم نشر المنشور بنجاح'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<CommunityCubit>().postController.clear();
            context.read<CommunityCubit>().imageUrl = '';
            context.read<CommunityCubit>().getAllPosts();
            Navigator.pop(context);
          }
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }

  Widget addImageToPost(
      {required BuildContext context, required String image}) {
    return context.read<CommunityCubit>().imageUrl == ''
        ? const SizedBox()
        : CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            imageBuilder: (context, imageProvider) => AspectRatio(
              aspectRatio: 1.35,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
  }
}
