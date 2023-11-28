import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/bloc/product/product_bloc.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/models/product_model.dart';
import 'package:makerre_flutter/models/search_result_model.dart';
import 'package:makerre_flutter/repositories/service_repository.dart';

class SubCategoryScreen extends StatefulWidget {
  final IService service;
  const SubCategoryScreen({super.key, required this.service});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen>
    with SingleTickerProviderStateMixin {
  final ServiceRepository serviceRepository = ServiceRepository();
  late TabController _tabController;
  late Future<List<ICategory>> menuItems;

  late String activeMenu;
  int activeIndex = 0;
  int selectedTab = 0;
  int listTab = 0;

  @override
  void initState() {
    initCategory();
    super.initState();
  }

  Future<List<ICategory>> initCategory() {
    menuItems = serviceRepository.getCategory();

    menuItems.then((value) {
      _tabController = TabController(vsync: this, length: value.length);
      activeMenu = value[0].name;
      listTab = value.length;
    });

    return menuItems;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            title: Text(widget.service.name),
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
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: ColorConfig.grayBDColor, width: 1),
                  ),
                ),
              ),
              FutureBuilder(
                future: menuItems,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final cate = snapshot.data;
                    context.read<ProductBloc>().add(
                          FetchProductInSubCategory(
                            categoryId: cate![0].id,
                            serviceId: widget.service.id,
                          ),
                        );
                    return SizedBox(
                      height: 48,
                      child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 23),
                        indicatorWeight: 3,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        labelColor: Theme.of(context).colorScheme.primary,
                        unselectedLabelColor: Colors.black,
                        onTap: (value) {
                          context.read<ProductBloc>().add(
                                FetchProductInSubCategory(
                                  categoryId: cate[value].id,
                                  serviceId: widget.service.id,
                                ),
                              );
                        },
                        tabs: cate.map(
                          (val) {
                            return Tab(
                              child: Text(val.name),
                            );
                          },
                        ).toList(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 28),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  final data = state.product;
                  return _buildTabBarView(data, context, listTab);
                } else {
                  return const Center(
                    child: Text('Something went wrong!!'),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  TabBarView _buildTabBarView(
      Product product, BuildContext context, int tabLength) {
    return TabBarView(
      controller: _tabController,
      children: List.generate(
        tabLength,
        (index) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: 10,
                      itemBuilder: (context, index, realIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            'assets/images/sub-banner.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.2,
                        viewportFraction: 1,
                        initialPage: activeIndex,
                        enlargeCenterPage: true,
                        onPageChanged:
                            (int index, CarouselPageChangedReason reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF727272),
                        ),
                        child: Text(
                          '${activeIndex + 1}/10',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xFFFFFFFF),
                                  ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 123건',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
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
                                style: Theme.of(context).textTheme.bodyLarge,
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
                const SizedBox(height: 28),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 15,
                  childAspectRatio: 80 / 135,
                  mainAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: SearchResult.searchResults
                      .map(
                        (val) => InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () {
                            context.goNamed(
                              'sub-cate-master',
                              pathParameters: {
                                'name': widget.service.name,
                                'id': val.id.toString(),
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                val.image,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    val.title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  val.isBookmark
                                      ? const Icon(Icons.bookmark)
                                      : const Icon(Icons.bookmark_outline),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                val.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${val.price.toStringAsFixed(0)} 원 ~',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        size: 17,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        val.rating.toStringAsFixed(1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${val.reviewCount.toStringAsFixed(0)} 리뷰',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
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
              child: const Text('평점순'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('평점순'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('평점순'),
            ),
          ],
        ),
      ),
    );
  }
}
