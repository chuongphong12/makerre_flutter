import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/review_model.dart';

class BestReviewScreen extends StatelessWidget {
  const BestReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviewList = ReviewModel.reviewList;
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
            title: const Text('베스트 리뷰'),
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
        child: Column(
          children: [
            const SizedBox(height: 24),
            ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviewList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(4),
                  splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  onTap: () {
                    GoRouter.of(context)
                        .goNamed('review-detail', params: {'id': reviewList[index].id.toString()});
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          reviewList[index].image,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    reviewList[index].title,
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    reviewList[index].subtitle,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFBDBDBD),
                                        ),
                                  ),
                                  const SizedBox(width: 17),
                                  RatingBar.builder(
                                    initialRating: reviewList[index].rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemSize: 16,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                    ),
                                    ignoreGestures: true,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                reviewList[index].description,
                                softWrap: true,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }
}
