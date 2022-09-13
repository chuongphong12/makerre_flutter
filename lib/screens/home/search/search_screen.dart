import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/search_result_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool hasResult = false;
  bool initTextState = true;
  String testValue = 'test';

  String searchValue = '';
  final List<String> recommendList = ['가방 리폼', '가방 리폼', '가방 리폼', '가방 리폼'];

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
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 5),
                  BackButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 27,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                        hintText: '원하는 서비스를 검색하세요',
                        filled: false,
                      ),
                      onSubmitted: (value) {
                        if (value == '' && value != testValue) {
                          setState(() {
                            initTextState = false;
                            hasResult = false;
                          });
                        } else if (value != '' && value == testValue) {
                          setState(() {
                            hasResult = true;
                            initTextState = false;
                            searchValue = value;
                          });
                        } else {
                          setState(() {
                            hasResult = false;
                            initTextState = false;
                            searchValue = value;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Divider(
                thickness: 1,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _buildSearchResult(context, recommendList),
      ),
    );
  }

  Widget _buildSearchResult(BuildContext context, List<String> recommendList) {
    if (initTextState == true && hasResult == false) {
      return Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '최근 검색어',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      '전체삭제',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: const Color(0xFFBDBDBD),
                          ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: recommendList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: const Icon(
                        Icons.close,
                        size: 18,
                        color: Color(0xFFBDBDBD),
                      ),
                      title: Text(
                        recommendList[index],
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFFBDBDBD),
                            ),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      );
    } else if (initTextState == false && hasResult == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              val.title,
                              style: Theme.of(context).textTheme.headline4,
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
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${val.price.toStringAsFixed(0)} 원 ~',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Text(
                              '${val.reviewCount.toStringAsFixed(0)} 리뷰',
                              style: Theme.of(context).textTheme.bodyText1,
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
      );
    } else if (initTextState == false && hasResult == false) {
      return Center(
        child: Text(
          '\'$searchValue\' 에 해당하는 결과값이 없습니다.',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: const Color(0xFFBDBDBD),
                fontWeight: FontWeight.normal,
              ),
        ),
      );
    } else {
      return Center(
        child: Text(
          '\'$searchValue\' 에 해당하는 결과값이 없습니다.',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: const Color(0xFFBDBDBD),
                fontWeight: FontWeight.normal,
              ),
        ),
      );
    }
  }
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
