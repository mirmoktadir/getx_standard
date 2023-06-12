import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_config.dart';

class GraphQLService extends GetxService {
  GraphQLConfig graphQLConfig = GraphQLConfig();

  Future<dynamic> performMutation(String mutation) async {
    final mutationOptions = MutationOptions(
      document: gql(mutation),
    );

    final result = await graphQLConfig.graphqlClient().mutate(mutationOptions);

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }

  Future<dynamic> performQuery(String query) async {
    final queryOptions = QueryOptions(
      document: gql(query),
    );

    final result = await graphQLConfig.graphqlClient().query(queryOptions);

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data;
  }
}
