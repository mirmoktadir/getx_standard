import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_config.dart';

class GraphQLService extends GetxService {
  GraphQLConfig graphQLConfig = GraphQLConfig();
  String errorMessage = "";
  Future<dynamic> performMutation(String mutation) async {
    final mutationOptions = MutationOptions(
      document: gql(mutation),
    );

    final result = await graphQLConfig.graphqlClient().mutate(mutationOptions);

    if (result.hasException) {
      final List<GraphQLError> errors = result.exception!.graphqlErrors;
      final LinkException? linkException = result.exception!.linkException;
      if (errors.isNotEmpty) {
        for (final GraphQLError error in errors) {
          errorMessage = error.message.toString();

          throw error.message;
        }
      } else if (linkException != null) {
        throw linkException;
      }
    }

    return result.data;
  }

  Future<dynamic> performQuery(String query) async {
    final queryOptions = QueryOptions(
      document: gql(query),
    );

    final result = await graphQLConfig.graphqlClient().query(queryOptions);

    if (result.hasException) {
      final List<GraphQLError> errors = result.exception!.graphqlErrors;
      final LinkException? linkException = result.exception!.linkException;
      if (errors.isNotEmpty) {
        for (final GraphQLError error in errors) {
          errorMessage = error.message.toString();

          throw error.message;
        }
      } else if (linkException != null) {
        throw linkException;
      }
    }

    return result.data;
  }
}
