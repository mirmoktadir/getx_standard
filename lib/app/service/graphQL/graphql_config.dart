import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
      // "https://graphqlzero.almansi.me/api",
      "https://api.mocki.io/v2/c4d7a195/graphql");

  GraphQLClient graphqlClient() => GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      );
}
