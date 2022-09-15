import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makerre_flutter/models/search_result_model.dart';

class SubCategoryScreen extends StatefulWidget {
  final String name;
  const SubCategoryScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTab = 0;
  final List<String> menuItems = [
    '가방',
    '신발',
    '지갑/벨트',
    '의류',
    '기타',
    '신발',
    '신발',
    '신발'
  ];

  String activeMenu = '가방';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: menuItems.length);
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
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            title: Text(widget.name),
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
          SizedBox(
            height: 48,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              labelPadding: const EdgeInsets.symmetric(horizontal: 23),
              indicatorWeight: 3,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
              tabs: menuItems.map(
                (val) {
                  return Tab(
                    child: Text(val),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: menuItems.map((e) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '총 123건',
                              style: Theme.of(context).textTheme.headline6,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '거리순',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
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
                                (val) => Column(
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        val.isBookmark
                                            ? const Icon(Icons.bookmark)
                                            : const Icon(
                                                Icons.bookmark_outline),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      val.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${val.price.toStringAsFixed(0)} 원 ~',
                                      style:
                                          Theme.of(context).textTheme.headline4,
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
                                                  .bodyText1,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${val.reviewCount.toStringAsFixed(0)} 리뷰',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
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