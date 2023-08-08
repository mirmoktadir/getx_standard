import 'package:get/get.dart';
import 'package:getx_standard/app/components/custom_snackbar.dart';
import 'package:getx_standard/app/service/network_connectivity.dart';

import '../../../components/navbar/navbar_controller.dart';
import '../../../data/local/my_hive.dart';
import '../../../service/REST/api_urls.dart';
import '../../../service/REST/dio_client.dart';
import '../../../service/handler/exception_handler.dart';
import '../model/posts.dart';

class HomeController extends GetxController with ExceptionHandler {
  final navController = Get.put(NavbarController());

  RxString title = "".obs;
  RxString body = "".obs;

  /// GET POST LIST
  final postList = RxList<Posts>();

  getPostList() async {
    showLoading();

    if (await NetworkConnectivity.isNetworkAvailable()) {
      // Fetch posts from the API
      var response =
          await DioClient().get(url: ApiUrl.allPosts).catchError(handleError);

      if (response == null) return;

      postList
          .assignAll((response as List).map((e) => Posts.fromJson(e)).toList());

      // Save fetched posts to Hive for future use
      await MyHive.saveAllPosts(postList);

      hideLoading();
    } else {
      // If offline, try to load from Hive
      CustomSnackBar.showCustomToast(message: "No network!");
      var posts = MyHive.getAllPosts();

      if (posts.isNotEmpty) {
        // Use posts from Hive if available
        postList.assignAll(posts);

        hideLoading();
        return;
      }
    }
    hideLoading();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getPostList();

    super.onReady();
  }
}
