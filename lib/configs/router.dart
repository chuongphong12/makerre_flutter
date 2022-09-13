import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/models/review_model.dart';
import 'package:makerre_flutter/screens/auth/login_screen.dart';
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
              routes: <GoRoute>[
                GoRoute(
                  name: 'search-result',
                  path: ':name',
                  builder: (context, state) {
                    final result = state.params['name'];
                    return SearchResultScreen(
                      result: result!,
                    );
                  },
                )
              ]),
        ],
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: 'mypage',
        path: '/mypage',
        builder: (context, state) {
          return const MyPageScreen();
        },
      )
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(
            state.error.toString(),
          ),
        ),
      ),
    ),
  );
}

ReviewModel _reviewFrom(String? id) {
  return ReviewModel.reviewList.where((val) => val.id.toString() == id).first;
}
