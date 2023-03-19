import 'package:get/get.dart';
import 'package:getx_standard/app/modules/home/bindings/home_binding.dart';
import 'package:getx_standard/app/modules/home/views/post_detail_view.dart';

import '../../../service/api_urls.dart';
import '../../../service/base_controller.dart';
import '../../../service/dio_client.dart';
import '../model/posts.dart';

class HomeController extends GetxController with BaseController {
  ///GET POST LIST
  final postList = RxList<Posts>();

  getPostList() async {
    showLoading();

    var response = await DioClient()
        .get(url: ApiUrl.allPosts, header: {}).catchError(handleError);

    if (response == null) return;

    postList
        .assignAll((response as List).map((e) => Posts.fromJson(e)).toList());

    hideLoading();
  }

  /// GET POST DETAIL
  String title = "";
  String body = "";

  getPostDetail(int? id) async {
    showLoading();
    var response = await DioClient().get(
        url: "${ApiUrl.postDetail}$id", header: {}).catchError(handleError);

    if (response == null) return;

    title = response["title"].toString();
    body = response["body"].toString();
    hideLoading();
    Get.to(() => const PostDetailView(), binding: HomeBinding());
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getPostList();

    super.onReady();
  }
}
