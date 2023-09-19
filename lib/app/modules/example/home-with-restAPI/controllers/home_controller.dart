import 'package:get/get.dart';
import 'package:getx_standard/app/modules/example/home-with-restAPI/model/recipes_model.dart';
import 'package:getx_standard/app/service/helper/network_connectivity.dart';

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

  /// GET ALL RECIPES LIST 'HIVE IMPLEMENTED'

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
    await getRecipes();

    super.onReady();
  }
}
