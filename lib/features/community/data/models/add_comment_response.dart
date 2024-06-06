import 'package:final_project/core/models/user_data.dart';

class AddCommentResponse {
  AddCommentResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AddCommentResponse.fromJson(Map<String, dynamic> json){
    return AddCommentResponse(
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
    required this.comments,
  });

  final List<Comment> comments;
  static const String commentsKey = "comments";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "comments": comments.map((x) => x.toJson()).toList(),
  };

}

class Comment {
  Comment({
    required this.text,
    required this.postedBy,
    required this.id,
  });

  final String? text;
  static const String textKey = "text";

  final User? postedBy;
  static const String postedByKey = "postedBy";

  final String? id;
  static const String idKey = "_id";


  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
      text: json["text"],
      postedBy: json["postedBy"] == null ? null : User.fromJson(json["postedBy"]),
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text": text,
    "postedBy": postedBy?.toJson(),
    "_id": id,
  };

}

