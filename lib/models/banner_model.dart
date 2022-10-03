class BannerModel {
    BannerModel({
        required this.id,
        required this.image,
        required this.imageDetail,
    });

    final int id;
    final String image;
    final String imageDetail;

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        image: json["image"],
        imageDetail: json["imageDetail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "imageDetail": imageDetail,
    };
}