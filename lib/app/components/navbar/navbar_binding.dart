import 'package:get/get.dart';

import '../../modules/example/home-with-graphql/controllers/graphql_controller.dart';
import '../../modules/example/home-with-restAPI/controllers/home_controller.dart';
import 'navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<GraphQLController>(
      () => GraphQLController(),
    );
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
  }
}
