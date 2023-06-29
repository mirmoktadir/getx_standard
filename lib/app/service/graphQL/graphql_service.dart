import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_config.dart';

class GraphQLService extends GetxService {
  GraphQLConfig graphQLConfig = GraphQLConfig();
  String errorMessage = "";

  /// MUTATIONS
  Future<dynamic> performMutation(String mutation) async {
    final mutationOptions = MutationOptions(
      document: gql(mutation),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await graphQLConfig.graphqlClient().mutate(mutationOptions);
    _checkException(result);
    return result.data;
  }

  ///
  Future<dynamic> performMutationWithFile({
    required String mutation,
    required File file,
    required String fileFieldName,
    Map<String, dynamic>? variables,
  }) async {
    final String base64File = base64Encode(file.readAsBytesSync());

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: {
        ...variables ?? {},
        fileFieldName: {
          'filename': file.path.split('/').last,
          'mimetype': 'YOUR_FILE_MIMETYPE',
          'encoding': 'base64',
          'content': base64File,
        },
      },
      fetchPolicy: FetchPolicy.noCache,
    );

    final result = await graphQLConfig.graphqlClient().mutate(options);

    _checkException(result);
    return result.data;
  }

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
