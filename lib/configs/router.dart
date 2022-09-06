import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/screens/auth/login_screen.dart';
import 'package:makerre_flutter/screens/home/home_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return const LoginScreen();
            },
          )
        ],
      ),
    ],
    initialLocation: '/',
  );
}
