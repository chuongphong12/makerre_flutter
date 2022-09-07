import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/widgets/app_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselItem {
  final String image;
  final String date;
  final String text;
  CarouselItem({
    required this.image,
    required this.date,
    required this.text,
  });
}

class ProductItem {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final double rating;
  ProductItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.rating,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  List<CarouselItem> carouselItem = [
    CarouselItem(
      image: 'assets/images/checker.png',
      date: '09.03 - 09.15',
      text: '원스모어 첫 회원 10% 할인 쿠폰',
    ),
    CarouselItem(
      image: 'assets/images/checker.png',
      date: '09.03 - 09.15',
      text: '원스모어 첫 회원 10% 할인 쿠폰',
    ),
    CarouselItem(
      image: 'assets/images/checker.png',
      date: '09.03 - 09.15',
      text: '원스모어 첫 회원 10% 할인 쿠폰',
    ),
    CarouselItem(
      image: 'assets/images/checker.png',
      date: '09.03 - 09.15',
      text: '원스모어 첫 회원 10% 할인 쿠폰',
    ),
  ];

  List<ProductItem> productList = [
    ProductItem(
      image: 'assets/images/pants.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔...',
      rating: 4,
    ),
    ProductItem(
      image: 'assets/images/bag.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔...',
      rating: 4,
    ),
    ProductItem(
      image: 'assets/images/fabric.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔...',
      rating: 4,
    ),
    ProductItem(
      image: 'assets/images/shirt.png',
      title: '김**님',
      subtitle: '가방 리폼',
      description: '처음엔 반신반의한 마음으로 신청을 했지만 받아보니 너무 제 스타일대로 만들어 주셔...',
      rating: 4,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/icons/Logo.svg', width: 110),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 276.0,
                    viewportFraction: 1,
                    initialPage: activeIndex,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  items: carouselItem.map((val) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(val.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 32.25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              val.date,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              width: 178,
                              child: Text(
                                val.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 16,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: carouselItem.length,
                    effect: const SlideEffect(
                      spacing: 8,
                      dotWidth: 33,
                      dotHeight: 2,
                      strokeWidth: 1.5,
                      activeDotColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/scissors-line.svg',
                            width: 52,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '리폼',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/bag-line.svg',
                            width: 52,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '수선',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/paint-line.svg',
                            width: 52,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '염색',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/washing-machine-line.svg',
                            width: 52,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '클리닝',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 64),
                  Text(
                    '찾으시는 서비스가 없나요?',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 52),
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        print('tap');
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        ),
                        hintText: '원하는 서비스를 검색해보세요.',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '베스트 리뷰',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '전체보기',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(width: 11),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Theme.of(context).colorScheme.onSurface,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: productList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 10),
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(productList[index].image),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Text(productList[index].title),
                                    Text(productList[index].subtitle),
                                    RatingBar.builder(
                                      initialRating: productList[index].rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 25,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
