import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageUrl, this.radius});

  final double? radius;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius ?? 28,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? CachHelper.getImageUrl(),
            placeholder: (context, url) => const CircularProgressIndicator(
              strokeWidth: 6,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
  }
}
