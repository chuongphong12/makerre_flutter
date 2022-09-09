import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      
      child: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('To Login screen'),
              onPressed: () {
                Navigator.pop(context);
                GoRouter.of(context).go('/login');
              },
            ),
            ElevatedButton(
              child: const Text('To Home screen'),
              onPressed: () {
                Navigator.pop(context);
                GoRouter.of(context).go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
