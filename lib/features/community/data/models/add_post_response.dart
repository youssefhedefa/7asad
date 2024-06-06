class AddPostResponse {
  AddPostResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AddPostResponse.fromJson(Map<String, dynamic> json){
    return AddPostResponse(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.post,
  });

  final SubPost? post;
  static const String postKey = "post";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      post: json["post"] == null ? null : SubPost.fromJson(json["post"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "post": post?.toJson(),
  };

}

class SubPost {
  SubPost({
    required this.content,
    required this.image,
    required this.postedBy,
    required this.likes,
    required this.id,
    required this.date,
    required this.comments,
    required this.v,
  });

  final String? content;
  static const String contentKey = "content";

  final String? image;
  static const String imageKey = "image";

  final String? postedBy;
  static const String postedByKey = "postedBy";

  final List<dynamic> likes;
  static const String likesKey = "likes";

  final String? id;
  static const String idKey = "_id";

  final DateTime? date;
  static const String dateKey = "date";

  final List<dynamic> comments;
  static const String commentsKey = "comments";

  final num? v;
  static const String vKey = "__v";


  factory SubPost.fromJson(Map<String, dynamic> json){
    return SubPost(
      content: json["content"],
      image: json["image"],
      postedBy: json["postedBy"],
      likes: json["likes"] == null ? [] : List<dynamic>.from(json["likes"]!.map((x) => x)),
      id: json["_id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "content": content,
    "image": image,
    "postedBy": postedBy,
    "likes": likes.map((x) => x).toList(),
    "_id": id,
    "date": date?.toIso8601String(),
    "comments": comments.map((x) => x).toList(),
    "__v": v,
  };

}
