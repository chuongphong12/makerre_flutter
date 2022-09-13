import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/search_result_model.dart';
import 'package:makerre_flutter/widgets/app_drawer.dart';

class SearchResultScreen extends StatelessWidget {
  final String result;
  const SearchResultScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool hasResult = false;
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed('home');
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(result),
                    trailing: Icon(
                      Icons.search,
                      size: 28,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 28),
            hasResult == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      '\'$result\' 에 해당하는 결과값이 없습니다.',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: const Color(0xFFBDBDBD),
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  )
          ],
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
