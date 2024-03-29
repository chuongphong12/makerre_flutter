import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/banner_model.dart';
import 'package:makerre_flutter/models/review_model.dart';
import 'package:makerre_flutter/repositories/banner_repository.dart';
import 'package:makerre_flutter/repositories/service_repository.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  final List<ReviewModel> productList = ReviewModel.reviewList;

  final BannerRepository bannerRepository = BannerRepository();
  final ServiceRepository serviceRepository = ServiceRepository();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: bannerRepository.getBanner(),
              builder: (context, AsyncSnapshot<List<BannerModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 276,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  final banners = snapshot.data;
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 276,
                          aspectRatio: MediaQuery.of(context).size.width / 276,
                          viewportFraction: 1,
                          autoPlay: true,
                          initialPage: activeIndex,
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                        ),
                        items: banners!.map((val) {
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).goNamed(
                                'banner',
                                pathParameters: {'id': val.id.toString()},
                              );
                            },
                            child: CachedNetworkImage(
                              imageUrl: val.image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: MediaQuery.of(context).size.width,
                                height: 276,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 276,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 15,
                        child: AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: banners.length,
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
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: serviceRepository.getService(),
                    builder: (context, AsyncSnapshot<List<IService>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        final services = snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: services!
                              .map((e) => _buildService(context, e))
                              .toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(height: 64),
                  Text(
                    '찾으시는 서비스가 없나요?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(height: 52),
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        GoRouter.of(context).goNamed('search');
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
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).goNamed('best-review');
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '전체보기',
                              style: Theme.of(context).textTheme.bodySmall,
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
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.345,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: productList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      width: 250,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(productList[index].image[0]),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      productList[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      productList[index].subtitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFBDBDBD),
                                          ),
                                    ),
                                    const SizedBox(width: 17),
                                    RatingBar.builder(
                                      initialRating: productList[index].rating,
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
                                        if (kDebugMode) {
                                          print(rating);
                                        }
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  productList[index].description,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
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
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }

  Widget _buildService(BuildContext context, IService services) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).goNamed(
          'sub-cate',
          pathParameters: {'name': services.name},
          extra: services,
        );
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: services.image,
            width: 50,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            services.name,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
