import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/models/search_result_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SubCategoryMasterScreen extends StatefulWidget {
  final String masterId;
  final String name;
  const SubCategoryMasterScreen({
    super.key,
    required this.masterId,
    required this.name,
  });

  @override
  State<SubCategoryMasterScreen> createState() =>
      _SubCategoryMasterScreenState();
}

class _SubCategoryMasterScreenState extends State<SubCategoryMasterScreen> {
  int activeIndex = 0;
  late SearchResult masterItem;

  @override
  void initState() {
    masterItem = SearchResult.searchResults
        .where((val) => val.id.toString() == widget.masterId)
        .first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchResult item = masterItem;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            shape: const Border.symmetric(
              horizontal: BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    initialPage: activeIndex,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  items: List.generate(
                    4,
                    (index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/celine-large.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: 4,
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '수선',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Icon(item.isBookmark
                          ? Icons.bookmark
                          : Icons.bookmark_outline),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: item.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 22,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (rating) {
                          if (kDebugMode) {
                            print(rating);
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          var id = Random().nextInt(100);
                          GoRouter.of(context).goNamed(
                            'review',
                            pathParameters: {
                              'reviewId': id.toString(),
                              'name': widget.name,
                              'id': widget.masterId
                            },
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: ColorConfig.grayBDColor),
                            ),
                          ),
                          margin: const EdgeInsets.only(left: 9),
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '${item.reviewCount.toStringAsFixed(0)} 리뷰보기',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${item.price.toStringAsFixed(0)}원 ~',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 52),
                  Text(
                    '소개',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '정보',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            '연락처',
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '결제 후  전화상담 제공',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            '위치',
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '서울 강남구',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            '거래 정보',
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '택배 or 직접방문 가능',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '서비스 제공 정보',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '#가방리폼전문 #명품전문 # 가방제작마스터 #셀린전문 #리폼 #프라다전문',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '마스터의 포트폴리오',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 4);
                },
                itemBuilder: (context, index) {
                  return Image.asset('assets/images/master-bag.png');
                },
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26.5, vertical: 16),
                      backgroundColor: ColorConfig.primaryColorLight,
                    ),
                    child: Text(
                      '쪽지',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorConfig.primaryColor,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.5, vertical: 16),
                      backgroundColor: ColorConfig.primaryColor,
                    ),
                    child: Text(
                      '마스터에게 요청서 보내기',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorConfig.whiteColor,
                          ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 33),
          ],
        ),
      ),
    );
  }
}
