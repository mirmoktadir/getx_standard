import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_config.dart';

class GraphQLService extends GetxService {
  GraphQLConfig graphQLConfig = GraphQLConfig();
  String errorMessage = "";

  /// QUERY
  Future<dynamic> performQuery(String query) async {
    final queryOptions = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await graphQLConfig.graphqlClient().query(queryOptions);

    _checkException(result);

    return result.data;
  }

  /// MUTATION
  Future<dynamic> performMutation(String mutation) async {
    final mutationOptions = MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await graphQLConfig.graphqlClient().mutate(mutationOptions);
    _checkException(result);
    return result.data;
  }

  /// MUTATION WITH FILE
  Future<dynamic> performMutationWithFile(
    String mutation,
  ) async {
    final mutationOptions = MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.noCache,
    );

    final result = await graphQLConfig.graphqlClient().mutate(mutationOptions);

    _checkException(result);
    return result.data;
  }

  /// ERROR CHECKER
  _checkException(result) {
    if (result.hasException) {
      final List<GraphQLError> errors = result.exception!.graphqlErrors;
      final LinkException? linkException = result.exception!.linkException;
      if (errors.isNotEmpty) {
        for (final GraphQLError error in errors) {
          errorMessage = error.message.toString();

          throw error.message;
        }
      } else if (linkException != null) {
        errorMessage = linkException.originalException.toString() != "null"
            ? linkException.originalException.toString()
            : "Something went wrong!";
        throw linkException;
      }
    }
  }
}