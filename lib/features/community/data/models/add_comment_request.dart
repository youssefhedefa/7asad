class AddCommentRequest {
  AddCommentRequest({
    required this.text,
  });

  final String? text;
  static const String textKey = "text";


  factory AddCommentRequest.fromJson(Map<String, dynamic> json){
    return AddCommentRequest(
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text": text,
  };

}
