import 'package:get/get.dart';
import 'package:getx_standard/app/service/graphQL/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService extends GetxService {
  GraphQLConfig graphQLConfig = GraphQLConfig();

  Future<GraphQLResult> performQuery(String query) async {
    final options = QueryOptions(document: gql(query));
    final result = await graphQLConfig.graphqlClient().query(options);
    return _handleResult(result);
  }

  Future<GraphQLResult> performMutation(String mutation) async {
    final options = MutationOptions(document: gql(mutation));
    final result = await graphQLConfig.graphqlClient().mutate(options);
    return _handleResult(result);
  }

  GraphQLResult _handleResult(QueryResult result) {
    if (result.hasException) {
      final graphqlError = result.exception?.graphqlErrors.first;
      throw GraphQLError(graphqlError!.message);
    } else {
      return GraphQLResult(result.data);
    }
  }
}

class GraphQLError implements Exception {
  final String message;

  GraphQLError(this.message);

  @override
  String toString() => 'GraphQLError: $message';
}

class GraphQLResult {
  final dynamic data;

  GraphQLResult(this.data);
}
