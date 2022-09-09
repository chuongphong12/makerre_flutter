import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> recommendList = ['가방 리폼', '가방 리폼', '가방 리폼', '가방 리폼'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 40),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
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
                    ),
                    onSubmitted: (value) {
                      if (value != '') {
                        GoRouter.of(context)
                            .goNamed('search-result', params: {'name': value});
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Theme.of(context).primaryColor,
          ),
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
      ),
    );
  }
}
