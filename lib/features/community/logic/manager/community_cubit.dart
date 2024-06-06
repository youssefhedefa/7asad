import 'dart:io';
import 'package:final_project/core/component/upload_image/data/repo/upload_image_repo.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/features/community/data/models/get_all_comments.dart';
import 'package:final_project/features/community/data/models/get_all_posts_response.dart';
import 'package:final_project/features/community/data/repo/community_repo.dart';
import 'package:final_project/features/community/logic/manager/community_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

class CommunityCubit extends Cubit<CommunityStates> {
  final CommunityRepo repository;
  final UploadImageRepo uploadImageRepo;

  CommunityCubit({required this.repository,required this.uploadImageRepo}) : super(const CommunityStates.initial());

  List<Post> posts = [];
  List<Comment> comments = [];

  TextEditingController commentController = TextEditingController();
  TextEditingController postController = TextEditingController();


  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  FormData? image;
  String? imageMimeType;

  Future<void> pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: source);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'image':
      await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
        contentType: MediaType(name, type),
      ),
    });
  }

  uploadImage() async {
    emit(const CommunityStates.loadingUploadImage());
    final result = await uploadImageRepo.uploadImage(image!);
    result.when(
      success: (data) {
        imageUrl = data.image ?? '';
        emit(CommunityStates.successUploadImage(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  getAllPosts() async {
    emit(const CommunityStates.loadingAllPosts());
    final result = await repository.getAllPosts();
    result.when(
      success: (data) {
        posts = data.data!.posts.reversed.toList();
        emit(CommunityStates.successAllPosts(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  addPost({required String text,required String image}) async {
    emit(const CommunityStates.loadingAddPost());
    final result = await repository.addPost(text: text, image: image);
    result.when(
      success: (data) {
        emit(CommunityStates.successAddPost(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  getCommentsPosts({required String id}) async {
    emit(const CommunityStates.loadingAllComments());
    final result = await repository.getCommentsPosts(id: id);
    result.when(
      success: (data) {
        comments = data.data!.comments;
        emit(CommunityStates.successAllComments(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  addComment({required String id, required String text}) async {
    emit(const CommunityStates.loadingAddComment());
    final result = await repository.addComment(id: id, text: text);
    result.when(
      success: (data) {
        emit(CommunityStates.successAddComment(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  likePost({required String id}) async {
    emit(const CommunityStates.loadingLikePost());
    final result = await repository.likePost(id: id);
    result.when(
      success: (data) {
        posts.firstWhere((post) => post.id == id).likes.add(CachHelper.getId());
        emit(CommunityStates.successLikePost(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

  unlikePost({required String id}) async {
    emit(const CommunityStates.loadingUnlikePost());
    final result = await repository.unlikePost(id: id);
    result.when(
      success: (data) {
        posts.firstWhere((post) => post.id == id).likes.remove(CachHelper.getId());
        emit(CommunityStates.successUnlikePost(data));
      },
      failure: (error) {
        emit(CommunityStates.error(error: error));
      },
    );
  }

}