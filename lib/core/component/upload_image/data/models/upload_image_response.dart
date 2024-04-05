class UploadImageResponse {
  String? image;
  String? size;


  UploadImageResponse({
    required this.image,
    required this.size,
  });
  UploadImageResponse.fromJson(Map<String, dynamic> json){
    image = json['image'];
    size = json['size'];
  }

  // create a toJson method to convert the model to json
  Map<String, dynamic> toJson(UploadImageResponse uploadImageResponse) =>
      <String, dynamic>{
        'image': uploadImageResponse.image,
        'size': uploadImageResponse.size,
      };
}
