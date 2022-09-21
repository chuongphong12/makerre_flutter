import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/models/review_model.dart';

class BestReviewDetailScreen extends StatelessWidget {
  final ReviewModel review;
  const BestReviewDetailScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(4),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/celine-bag.png',
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '픽스 마스터',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Old Celine, Celine 을 전문으로 합니다. 다양한 사이즈의 가방으로 리폼이 가능합니다.',
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(
                  color: Color(0xFFE0E0E0),
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      review.title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      review.subtitle,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: const Color(0xFFBDBDBD),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: review.rating,
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
                  review.description,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.6),
                ),
                const SizedBox(height: 16),
                Material(
                  borderRadius: BorderRadius.circular(4),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    review.image[0],
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
