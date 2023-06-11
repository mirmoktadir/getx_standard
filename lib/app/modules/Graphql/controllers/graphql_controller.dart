import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/service/REST/base_controller.dart';

import '../../../service/graphQL/graphql_service.dart';

class GraphQLController extends GetxController with BaseController {
  final GraphQLService graphQLService = GraphQLService();
  final albumList = RxList<dynamic>();
  _albumQuery() {
    return """
    query Query {
  albums(options:{paginate:{page:2,limit:10}}){
    data{
      title
      photos{
        data{
          thumbnailUrl
        }
      }
    }
  }
}
    """;
  }

  getAlbums() async {
    try {
      showLoading();
      var result = await graphQLService.performQuery(_albumQuery());
      albumList.value = List.from(result.data["albums"]["data"]);
      if (kDebugMode) {
        print(result.data);
      }
      hideLoading();
    } catch (e) {
      showLoading();
      print(e);
      hideLoading();
    }
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getAlbums();

    super.onReady();
  }
}
