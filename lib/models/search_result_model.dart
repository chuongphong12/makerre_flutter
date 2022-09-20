class SearchResult {
  final int id;
  final String image;
  final String title;
  final String description;
  final double price;
  final double reviewCount;
  final double rating;
  final bool isBookmark;

  SearchResult({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.reviewCount,
    required this.rating,
    required this.isBookmark,
  });

  static final List<SearchResult> searchResults = [
    SearchResult(
      id: 1001,
      image: 'assets/images/search_result/celine-bag.png',
      title: '픽스 마스터',
      isBookmark: true,
      description:
          'Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의 Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의',
      price: 500000,
      rating: 4.9,
      reviewCount: 108,
    ),
    SearchResult(
      id: 1002,
      image: 'assets/images/search_result/t-shirt.png',
      title: '세탁 특공',
      isBookmark: true,
      description: '명품 세탁 1위 비결은 깔끔함에 있습니다. 세탁 특공은',
      price: 450000,
      rating: 4.8,
      reviewCount: 80,
    ),
    SearchResult(
      id: 1003,
      image: 'assets/images/search_result/blanket.png',
      title: '수리수리 마수리',
      isBookmark: false,
      description: '명품 세탁 1위 비결은 깔끔함에 있습니다. 세탁 특공은 ',
      price: 680000,
      rating: 4.6,
      reviewCount: 222,
    ),
    SearchResult(
      id: 1004,
      image: 'assets/images/search_result/coffee.png',
      title: '리폼의 신',
      isBookmark: false,
      description: 'Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의',
      price: 230000,
      rating: 4.9,
      reviewCount: 65,
    ),
    SearchResult(
      id: 1005,
      image: 'assets/images/search_result/noddle.png',
      title: '수리수리 마수리',
      isBookmark: false,
      description:
          'Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의 Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의',
      price: 125000,
      rating: 4.4,
      reviewCount: 9,
    ),
    SearchResult(
      id: 1006,
      image: 'assets/images/search_result/old-guy.png',
      title: '수선 매니아',
      isBookmark: false,
      description:
          'Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의 Old Celine, Celine을 전문으로 합니다. 다양한 사이즈의',
      price: 310000,
      rating: 4.8,
      reviewCount: 201,
    )
  ];
}
