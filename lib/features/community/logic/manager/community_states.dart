
import 'package:freezed_annotation/freezed_annotation.dart';
part 'community_states.freezed.dart';

@freezed
class CommunityStates<T> with _$CommunityStates<T>{
  const factory CommunityStates.initial() = _Initial;
  const factory CommunityStates.loadingAllPosts() = LoadingAllPosts;
  const factory CommunityStates.successAllPosts(T data) = SuccessAllPosts<T>;
  const factory CommunityStates.loadingAddPost() = LoadingAddPost;
  const factory CommunityStates.successAddPost(T data) = SuccessAddPost<T>;
  const factory CommunityStates.loadingUploadImage() = LoadingUploadImage;
  const factory CommunityStates.successUploadImage(T data) = SuccessUploadImage<T>;
  const factory CommunityStates.loadingAllComments() = LoadingAllComments;
  const factory CommunityStates.successAllComments(T data) = SuccessAllComments<T>;
  const factory CommunityStates.loadingAddComment() = LoadingAddComment;
  const factory CommunityStates.successAddComment(T data) = SuccessAddComment<T>;
  const factory CommunityStates.loadingLikePost() = LoadingLikePost;
  const factory CommunityStates.successLikePost(T data) = SuccessLikePost<T>;
  const factory CommunityStates.loadingUnlikePost() = LoadingUnlikePost;
  const factory CommunityStates.successUnlikePost(T data) = SuccessUnlikePost<T>;
  const factory CommunityStates.error({required String error}) = Error;
}