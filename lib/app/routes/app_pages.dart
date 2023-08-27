import 'package:get/get.dart';

import '../components/navbar/bottom_navbar.dart';
import '../components/navbar/navbar_binding.dart';
import '../modules/home-with-graphql/bindings/graphql_binding.dart';
import '../modules/home-with-graphql/views/graphql_view.dart';
import '../modules/home-with-restAPI/bindings/home_binding.dart';
import '../modules/home-with-restAPI/views/home_view.dart';
import '../modules/home-with-restAPI/views/post_detail_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ONBOARDING = Routes.ONBOARDING;
  static const NAV = Routes.NAV;
  static const HOME = Routes.HOME;
  static const POST_DETAIL = Routes.POST_DETAIL;

  static final routes = [
    /// NAV BAR
    GetPage(
      name: _Paths.NAV,
      page: () => const BottomNavbar(),
      binding: NavbarBinding(),
    ),

    ///
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAIL,
      page: () => const PostDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GRAPHQL,
      page: () => const GraphQLView(),
      binding: GraphQLBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
