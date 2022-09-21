import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/models/review_model.dart';

class ReviewScreen extends StatelessWidget {
  final String reviewId;
  const ReviewScreen({Key? key, required this.reviewId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviews = ReviewModel.reviewList;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 3,
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            title: const Text('리뷰'),
            centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFFBDBDBD),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _buildBottomModal(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '거리순',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            reviews[index].title,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            reviews[index].subtitle,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: const Color(0xFFBDBDBD),
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: reviews[index].rating,
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
                              print(rating);
                            },
                          ),
                          const SizedBox(width: 11),
                          Text(
                            '1개월 전',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        reviews[index].description,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(height: 1.6),
                      ),
                      const SizedBox(height: 16),
                      reviews[index].image.length > 1
                          ? GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 1,
                              crossAxisCount: 4,
                              crossAxisSpacing: 6,
                              children: reviews[index].image.map(
                                (val) {
                                  return ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(
                                      val,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ).toList(),
                            )
                          : Material(
                              borderRadius: BorderRadius.circular(4),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                reviews[index].image[0],
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: ColorConfig.grayE0Color),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildBottomModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      constraints:
          const BoxConstraints.tightFor(height: 174, width: double.infinity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('최신순'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('별점 높은순'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('별점 낮은순'),
            ),
          ],
        ),
      ),
    );
  }
}
