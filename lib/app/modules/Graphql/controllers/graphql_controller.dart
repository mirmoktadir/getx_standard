import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/custom_snackbar.dart';
import 'package:getx_standard/app/service/REST/base_controller.dart';

import '../../../service/graphQL/graphql_service.dart';

class GraphQLController extends GetxController with BaseController {
  final GraphQLService graphQLService = GraphQLService();
  final userList = RxList<dynamic>();
  RxString mutationResult = "".obs;

  /////////////////////   QUERY /////////////////////////

  Future<void> getAlbums() async {
    try {
      showLoading();
      // Build your query string
      const query = """
    query Query{
  users{
    id
    name
    email
    todos{
      description
    }
  }
 
}
    """;

      // Perform the query
      final result = await graphQLService.performQuery(query);
      userList.value = List.from(result["users"]);
      hideLoading();
      // Handle the result
      // Update the UI or perform other actions with the result
    } catch (error) {
      // Handle the exception
      hideLoading();
      CustomSnackBar.showCustomErrorSnackBar(
          title: "Error!", message: error.toString());
      if (kDebugMode) {
        print('Error: $error');
      }
      // Show a snackbar or dialog to inform the user about the error
    }
  }

  ////////////////////////  MUTATION   ///////////////////////////

  Future<void> updateTodo() async {
    try {
      showLoading();
      // Build your mutation or query string
      const mutation = '''
        mutation {
          updateTodo(input:{id:"Hello World",description:"Hello World"}){
            id
            description
            done
        }
      }
      ''';

      // Perform the mutation
      final result = await graphQLService.performMutation(mutation);
      mutationResult.value = result.toString();
      hideLoading();
      // Handle the result
      // Update the UI or perform other actions with the result
    } catch (error) {
      // Handle the exception
      hideLoading();
      CustomSnackBar.showCustomErrorSnackBar(
          title: "Error!", message: error.toString());
      if (kDebugMode) {
        print('Error: $error');
      }
      // Show a snackbar or dialog to inform the user about the error
    }
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getAlbums();

    super.onReady();
  }
}
