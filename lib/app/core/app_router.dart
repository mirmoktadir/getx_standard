import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/navbar/fixed_bottom_navbar.dart';
import '../components/navbar/floating_bottom_navbar.dart';
import '../modules/example/home-with-graphql/views/graphql_view.dart';
import '../modules/example/home-with-restAPI/views/home_view.dart';
import '../modules/example/home-with-restAPI/views/post_detail_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import 'navigator_key.dart';

abstract class AppRoutes {
  static const String fixedNav = '/fixed_nav';
  static const String floatingNav = '/floating_nav';
  static const String home = '/home';
  static const String postDetail = '/post_detail';
  static const String graphql = '/graphql';
  static const String onboarding = '/onboarding';
}

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.fixedNav,
  routes: [
    GoRoute(
      path: AppRoutes.fixedNav,
      builder: (context, state) => const FixedBottomNavbar(),
    ),
    GoRoute(
      path: AppRoutes.floatingNav,
      builder: (context, state) => const FloatingBottomNavbar(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: AppRoutes.postDetail,
      builder: (context, state) => const PostDetailView(),
    ),
    GoRoute(
      path: AppRoutes.graphql,
      builder: (context, state) => const GraphQLView(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);
