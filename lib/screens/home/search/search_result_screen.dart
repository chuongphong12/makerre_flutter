import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/widgets/app_drawer.dart';

class SearchResultScreen extends StatelessWidget {
  final String result;
  const SearchResultScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool hasResult = true;
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/images/icons/Logo.svg',
          width: 120,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(
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
                                showModalBottomSheet(
                                  context: context,
                                  enableDrag: true,
                                  constraints: const BoxConstraints.tightFor(
                                      height: 174, width: double.infinity),
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
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
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
                      )
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
    );
  }
}
