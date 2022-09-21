import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/configs/color.dart';
import 'package:makerre_flutter/widgets/app_drawer.dart';

class ServicesCenter {
  final String title;
  final String path;
  ServicesCenter({
    required this.title,
    required this.path,
  });
}

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final List<String> orders = ['신규 요청서', '나의 거래', '스크랩', '내가 쓴 리뷰'];
  final List<ServicesCenter> servicesCenter = [
    ServicesCenter(title: '문의하기', path: '문의하기'),
    ServicesCenter(title: '이용약관', path: '이용약관'),
    ServicesCenter(title: '개인정보 처리방침', path: '개인정보 처리방침'),
    ServicesCenter(title: '마케팅 수신 동의 약관', path: '마케팅 수신 동의 약관'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9FAFA),
        title: SvgPicture.asset('assets/images/icons/Logo.svg', width: 110),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(color: Color(0xffF9FAFA)),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "이지원 님",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    onPressed: (() {}),
                    icon: const Icon(Icons.edit),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(77, 219, 219, 219),
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          const Color(0xffbdbdbdb),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size(30, 30),
                        ),
                        elevation: MaterialStateProperty.all(5),
                        shadowColor: MaterialStateProperty.all(
                          const Color.fromARGB(223, 236, 235, 235),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 28),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://icdn.dantri.com.vn/thumb_w/660/2021/08/25/huynh-thai-ngocdocx-1629865037464.jpeg'),
              ),
            ),
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
            // shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "주문",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                          color: ColorConfig.grayE0Color,
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          title: Text(
                            orders[index],
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                          onTap: () {},
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "고객센터",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                        color: ColorConfig.grayE0Color,
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: servicesCenter.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        title: Text(
                          servicesCenter[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        onTap: () {
                          GoRouter.of(context)
                              .goNamed('/${servicesCenter[index].path}');
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
