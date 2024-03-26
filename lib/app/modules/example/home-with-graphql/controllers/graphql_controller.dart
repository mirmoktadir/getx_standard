import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/my_snackbar.dart';
import 'package:getx_standard/app/modules/example/home-with-graphql/models/country_model.dart';
import 'package:getx_standard/app/modules/example/home-with-restAPI/controllers/home_controller.dart';
import 'package:getx_standard/app/service/handler/exception_handler.dart';
import 'package:logger/logger.dart';

import '../../../../components/navbar/navbar_controller.dart';

class GraphQLController extends GetxController with ExceptionHandler {
  final navController = Get.put(NavbarController());

  final countryList = RxList<Countries>();
  RxString mutationResult = "".obs;

  /////////////////////   QUERY /////////////////////////

  Future<void> getCountries() async {
    showLoading();
    // Build your query string
    const query = """
    query Query{
   countries {
    code
    name
    emoji
  }
 
}
    """;

    final result =
        await graphQLService.performQuery(query).catchError(handleGraphqlError);
    if (result == null) return;

    countryList.assignAll((result["countries"] as List)
        .map((e) => Countries.fromJson(e))
        .toList());
    Logger().d(result);
    hideLoading();
  }

  ////////////////////////  MUTATION   ///////////////////////////

  Future<void> updateTodo() async {
    showLoading();

    const mutation = '''
        mutation {
          updateTodo(input:{id:"Hello World",description:"Hello World"}){
            id
            description
            done
        }
      }
      ''';

    final result = await graphQLService
        .performMutation(mutation)
        .catchError(handleGraphqlError);
    if (result == null) return;
    mutationResult.value = result.toString();
    hideLoading();
    MySnackBar.showToast(message: "Mutation success!");
  }

  ///

  @override
  void onReady() async {
    await getCountries();
    Get.find<HomeController>().bottomPadding.value = 18.sp;
    super.onReady();
  }
}
