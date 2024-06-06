class AddPostRequest {
  AddPostRequest({
    required this.content,
    required this.image,
  });

  final String? content;
  static const String contentKey = "content";

  final String? image;
  static const String imageKey = "image";


  factory AddPostRequest.fromJson(Map<String, dynamic> json){
    return AddPostRequest(
      content: json["content"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "content": content,
    "image": image,
  };

}
