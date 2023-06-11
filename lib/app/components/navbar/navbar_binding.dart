import 'package:get/get.dart';
import 'package:getx_standard/app/modules/home/controllers/home_controller.dart';

import '../../modules/Graphql/controllers/graphql_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<GraphQLController>(
      () => GraphQLController(),
    );
  }
}
