import 'package:get/get.dart';
import 'package:getx_standard/app/modules/example/home-with-restAPI/model/recipes_model.dart';
import 'package:getx_standard/app/service/helper/network_connectivity.dart';
import 'package:logger/logger.dart';

import '../../../../components/global-widgets/custom_snackbar.dart';
import '../../../../components/navbar/navbar_controller.dart';
import '../../../../data/local/my_hive.dart';
import '../../../../service/REST/api_urls.dart';
import '../../../../service/REST/dio_client.dart';
import '../../../../service/handler/exception_handler.dart';

class HomeController extends GetxController with ExceptionHandler {
  final navController = Get.put(NavbarController());

  RxString title = "".obs;
  RxString body = "".obs;

  final recipes = RxList<Results>();

  /// GET POST LIST 'HIVE IMPLEMENTED'
  // final postList = RxList<Posts>();
  //
  // getPostList() async {
  //   showLoading();
  //   if (await NetworkConnectivity.isNetworkAvailable()) {
  //     // Fetch posts from the API
  //
  //     var response =
  //         await DioClient().get(url: ApiUrl.allPosts).catchError(handleError);
  //
  //     if (response == null) return;
  //
  //     postList
  //         .assignAll((response as List).map((e) => Posts.fromJson(e)).toList());
  //
  //     // Save fetched posts to Hive for future use
  //     await MyHive.saveAllPosts(postList);
  //
  //     hideLoading();
  //   } else {
  //     // If offline, try to load from Hive
  //
  //     var posts = MyHive.getAllPosts();
  //
  //     if (posts.isNotEmpty) {
  //       // Use posts from Hive if available
  //       postList.assignAll(posts);
  //
  //       hideLoading();
  //       CustomSnackBar.showCustomErrorToast(message: "No network!");
  //       return;
  //     } else {
  //       isError.value = true;
  //
  //       hideLoading();
  //       showErrorDialog("Oops!", "Connection problem");
  //       return;
  //     }
  //   }
  // }

  getRecipes() async {
    showLoading();
    if (await NetworkConnectivity.isNetworkAvailable()) {
      /// Fetch recipes from the API
      var response = await DioClient().get(
          url: ApiUrl.allRecipes,
          params: {"from": 0, "size": 20}).catchError(handleError);

      if (response == null) return;

      recipes.assignAll((response["results"] as List)
          .map((e) => Results.fromJson(e))
          .toList());

      /// Save fetched posts to Hive for future use
      await MyHive.saveAllRecipes(recipes);
      hideLoading();
      Logger().d(response);
    } else {
      /// If offline, try to load from Hive
      var savedRecipes = MyHive.getAllRecipes();

      if (savedRecipes.isNotEmpty) {
        recipes.assignAll(savedRecipes);
        hideLoading();
        CustomSnackBar.showCustomErrorToast(message: "No network!");
        return;
      } else {
        isError.value = true;

        hideLoading();
        showErrorDialog("Oops!", "Connection problem");
        return;
      }
    }
  }

  @override
  void onReady() async {
    // await getPostList();
    await getRecipes();

    super.onReady();
  }
}
