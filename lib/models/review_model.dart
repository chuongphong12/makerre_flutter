class ReviewModel {
  final double id;
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final double rating;

  ReviewModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.rating,
  });

  static final List<ReviewModel> reviewList = [
    ReviewModel(
      id: 1001,
      image: 'assets/images/pants.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔서 100% 만족했습니다. 앞으로 자주 이용하겠습니다~!!!',
      rating: 4,
    ),
    ReviewModel(
      id: 1002,
      image: 'assets/images/bag.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔서 100% 만족했습니다. 앞으로 자주 이용하겠습니다~!!!',
      rating: 4,
    ),
    ReviewModel(
      id: 1003,
      image: 'assets/images/fabric.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔서 100% 만족했습니다. 앞으로 자주 이용하겠습니다~!!!',
      rating: 4,
    ),
    ReviewModel(
      id: 1004,
      image: 'assets/images/shirt.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔서 100% 만족했습니다. 앞으로 자주 이용하겠습니다~!!!',
      rating: 4,
    )
  ];
}
