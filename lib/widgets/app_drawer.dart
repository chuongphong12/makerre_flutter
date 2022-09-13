import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: SafeArea(
        minimum:
            const EdgeInsets.only(top: 160, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://icdn.dantri.com.vn/thumb_w/660/2021/08/25/huynh-thai-ngocdocx-1629865037464.jpeg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 16),
                  child: Text(
                    '이지원 고객님',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  height: 2,
                  color: Colors.black,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 36),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      GoRouter.of(context).go('/');
                    },
                    child: Text(
                      "홈",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () {
                      print("click transaction history");
                    },
                    child: Text(
                      "나의 거래",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () {
                      print("click chat");
                    },
                    child: Text(
                      "쪽지",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/mypage');
                      print("click my page");
                    },
                    child: Text(
                      "마이페이지",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () {
                  print("click logout");
                },
                child: Text(
                  "마스터로 활동",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Color(0xFFFF4200)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
