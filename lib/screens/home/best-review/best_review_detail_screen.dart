import 'package:flutter/material.dart';
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
      ),
      body: Column(
        children: [
          AppBar(
            title: const Text('베스트 리뷰'),
            centerTitle: true,
            shape: const Border.symmetric(
              horizontal: BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/celine-bag.png',
                      width: 80,
                      fit: BoxFit.cover,
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
