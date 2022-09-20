import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/review_model.dart';
import 'package:makerre_flutter/screens/auth/login/login_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/signup_infor_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/signup_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/test1.dart';
import 'package:makerre_flutter/screens/auth/signup/test2.dart';
import 'package:makerre_flutter/screens/auth/transaction/transaction_screen.dart';
import 'package:makerre_flutter/screens/home/banner/banner_screen.dart';
import 'package:makerre_flutter/screens/home/best-review/best_review_detail_screen.dart';
import 'package:makerre_flutter/screens/home/best-review/best_review_screen.dart';
import 'package:makerre_flutter/screens/home/home_screen.dart';
import 'package:makerre_flutter/screens/home/mypage/mypage_screen.dart';
import 'package:makerre_flutter/screens/home/search/search_result_screen.dart';
import 'package:makerre_flutter/screens/home/search/search_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <GoRoute>[
          GoRoute(
            name: 'best-review',
            path: 'best-review',
            builder: (context, state) {
              return const BestReviewScreen();
            },
            routes: <GoRoute>[
              GoRoute(
                name: 'review-detail',
                path: ':id',
                builder: (context, state) {
                  final reviewId = state.params['id'];

                  return BestReviewDetailScreen(
                    review: _reviewFrom(reviewId),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: 'banner',
            path: 'banner',
            builder: (context, state) {
              return const BannerScreen();
            },
          ),
          GoRoute(
            name: 'search',
            path: 'search',
            builder: (context, state) {
              return const SearchScreen();
            },
          ),
        ],
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
        routes: <GoRoute>[
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (context, state) {
              return const SignUpScreen();
            },
          ),
          GoRoute(
            name: 'signup_infor',
            path: 'signup_infor',
            builder: (context, state) {
              return SignUpInforScreen();
            },
          ),
        ],
      ),
      GoRoute(
        name: 'mypage',
        path: '/mypage',
        builder: (context, state) {
          return const MyPageScreen();
        },
      ),
      GoRoute(
        name: 'transaction',
        path: '/transaction',
        builder: (context, state) {
          return const TransactionScreen();
        },
      )
    ],
    initialLocation: "/login",
    errorBuilder: (context, state) => Scaffold(
      key: state.pageKey,
      body: Center(
        child: Text(
          state.error.toString(),
        ),
      ),
    ),
  );
}

ReviewModel _reviewFrom(String? id) {
  return ReviewModel.reviewList.where((val) => val.id.toString() == id).first;
}
