import 'package:final_project/core/models/user_data.dart';

class AllCommunityPostsResponse {
  AllCommunityPostsResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final num? results;
  static const String resultsKey = "results";

  final Data? data;
  static const String dataKey = "data";


  factory AllCommunityPostsResponse.fromJson(Map<String, dynamic> json){
    return AllCommunityPostsResponse(
      status: json["status"],
      results: json["results"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.posts,
  });

  final List<Post> posts;
  static const String postsKey = "posts";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "posts": posts.map((x) => x.toJson()).toList(),
  };

}

class Post {
  Post({
    required this.id,
    required this.content,
    required this.postedBy,
    required this.likes,
    required this.date,
    required this.comments,
    required this.v,
    required this.image,
  });

  final String? id;
  static const String idKey = "_id";

  final String? content;
  static const String contentKey = "content";

  final User? postedBy;
  static const String postedByKey = "postedBy";

  final List<dynamic> likes;
  static const String likesKey = "likes";

  final DateTime? date;
  static const String dateKey = "date";

  final List<dynamic> comments;
  static const String commentsKey = "comments";

  final num? v;
  static const String vKey = "__v";

  final String? image;
  static const String imageKey = "image";


  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["_id"],
      content: json["content"],
      postedBy: json["postedBy"] == null ? null : User.fromJson(json["postedBy"]),
      likes: json["likes"] == null ? [] : List<dynamic>.from(json["likes"]!.map((x) => x)),
      date: DateTime.tryParse(json["date"] ?? ""),
      comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
      v: json["__v"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "postedBy": postedBy?.toJson(),
    "likes": likes.map((x) => x).toList(),
    "date": date?.toIso8601String(),
    "comments": comments.map((x) => x).toList(),
    "__v": v,
    "image": image,
  };

}

