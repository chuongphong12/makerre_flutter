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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://icdn.dantri.com.vn/thumb_w/660/2021/08/25/huynh-thai-ngocdocx-1629865037464.jpeg'),
            ),
            const SizedBox(height: 20),
            Text(
              '이지원 고객님',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 15),
            const Divider(thickness: 2, color: Colors.black),
            const SizedBox(height: 36),
            const MenuListTile(title: '홈', path: '/'),
            const MenuListTile(title: '나의 거래', path: '/'),
            const MenuListTile(title: '쪽지', path: '/'),
            const MenuListTile(title: '마이페이지', path: '/mypage'),
            Expanded(child: Container()),
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
                      .copyWith(color: const Color(0xFFFF4200)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  final String title;
  final String path;
  const MenuListTile({
    Key? key,
    required this.title,  
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        GoRouter.of(context).go(path);
      },
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
