import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makerre_flutter/bloc/auth/auth_bloc.dart';
import 'package:makerre_flutter/models/review_model.dart';
import 'package:makerre_flutter/repositories/auth_repository.dart';
import 'package:makerre_flutter/screens/auth/login/login_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/signup_infor_screen.dart';
import 'package:makerre_flutter/screens/auth/signup/signup_screen.dart';
import 'package:makerre_flutter/screens/auth/transaction/transaction_screen.dart';
import 'package:makerre_flutter/screens/home/banner/banner_screen.dart';
import 'package:makerre_flutter/screens/home/best-review/best_review_detail_screen.dart';
import 'package:makerre_flutter/screens/home/best-review/best_review_screen.dart';
import 'package:makerre_flutter/screens/home/home_screen.dart';
import 'package:makerre_flutter/screens/home/review/review_screen.dart';
import 'package:makerre_flutter/screens/home/search/search_screen.dart';
import 'package:makerre_flutter/screens/home/sub-category/sub_category_master_screen.dart';
import 'package:makerre_flutter/screens/home/sub-category/sub_category_screen.dart';
import 'package:makerre_flutter/screens/mypage/mypage_screen.dart';

class GoRouterClass {
  final AuthBloc authBloc;
  final AuthRepositories authRepositories;

  GoRouterClass({
    required this.authBloc,
    required this.authRepositories,
  });

  late final goRouter = GoRouter(
    redirect: (context, goState) {
      // if the user is not logged in, they need to login
      AuthenticationStatus appStatus = authBloc.state.status;
      bool loggedIn = appStatus == AuthenticationStatus.authenticated;

      final loggingIn = goState.location == '/login';

      // bundle the location the user is coming from into a query parameter
      final fromp = goState.subloc == '/' ? '' : '?from=${goState.subloc}';
      if (!loggedIn && !loggingIn) {
        return '/login';
      }

      // if the user is logged in, send them where they were going before (or
      // home if they weren't going anywhere)
      if (loggingIn && loggedIn) {
        return '/';
      }

      // no need to redirect at all
      return null;
    },
    refreshListenable: AuthStateNotifier(
      authRepositories: authRepositories,
      authBloc: authBloc,
    ),
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
          GoRoute(
            name: 'sub-cate',
            path: 'sub-category/:name',
            builder: (context, state) {
              final name = state.params['name'];
              return SubCategoryScreen(
                name: name!,
              );
            },
            routes: <GoRoute>[
              GoRoute(
                name: 'sub-cate-master',
                path: ':id',
                builder: (context, state) {
                  final id = state.params['id'];
                  final name = state.params['name'];
                  return SubCategoryMasterScreen(
                    masterId: id!,
                    name: name!,
                  );
                },
                routes: <GoRoute>[
                  GoRoute(
                    path: 'review/:reviewId',
                    name: 'review',
                    builder: (context, state) {
                      final id = state.params['id'];
                      final name = state.params['name'];
                      final reviewId = state.params['reviewId'];
                      return ReviewScreen(
                        reviewId: reviewId!,
                      );
                    },
                  )
                ],
              ),
            ],
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
              return const SignUpInforScreen();
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
    initialLocation: '/',
    errorBuilder: (context, state) => Scaffold(
      key: state.pageKey,
      body: Center(
        child: Text(
          state.error.toString(),
        ),
      ),
    ),
  );

  ReviewModel _reviewFrom(String? id) {
    return ReviewModel.reviewList.where((val) => val.id.toString() == id).first;
  }
}

class AuthStateNotifier with ChangeNotifier {
  final AuthRepositories authRepositories;
  final AuthBloc authBloc;
  late StreamSubscription<AuthenticationStatus>
      authenticationStatusSubscription;
  AuthStateNotifier({
    required this.authRepositories,
    required this.authBloc,
  }) {
    notifyListeners();
    authenticationStatusSubscription = authRepositories.status.listen(
      (status) {
        authBloc.add(AuthenticationStatusChanged(status));
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    authenticationStatusSubscription.cancel();
    authRepositories.dispose();
    super.dispose();
  }
}
