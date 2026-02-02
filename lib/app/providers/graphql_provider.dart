import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../modules/example/home-with-graphql/models/country_model.dart';
import '../service/handler/exception_handler.dart';
import 'home_provider.dart';

final graphqlProvider = NotifierProvider<GraphQLNotifier, GraphQLState>(
  GraphQLNotifier.new,
);

class GraphQLState {
  final List<Countries> countryList;
  final String mutationResult;
  final bool isError;

  GraphQLState({
    this.countryList = const [],
    this.mutationResult = '',
    this.isError = false,
  });
}

class GraphQLNotifier extends Notifier<GraphQLState> with ExceptionHandler {
  @override
  GraphQLState build() {
    return GraphQLState();
  }

  Future<void> getCountries() async {
    showLoading(ref);
    const query = """
    query Query{
   countries {
    code
    name
    emoji
  }
 
}
    """;

    final result = await graphQLService.performQuery(query).catchError((e) {
      handleGraphqlError(ref, e);
      state = GraphQLState(
        countryList: state.countryList,
        mutationResult: state.mutationResult,
        isError: true,
      );
      return null;
    });

    if (result == null) return;

    final list = (result["countries"] as List)
        .map((e) => Countries.fromJson(e))
        .toList();

    hideLoading(ref);
    state = GraphQLState(
      countryList: list,
      mutationResult: state.mutationResult,
      isError: false,
    );

    // Reset home bottom padding when graphql screen loads
    ref.read(homeProvider.notifier).setBottomPadding(18.sp);
  }

  void setMutationResult(String value) {
    state = GraphQLState(
      countryList: state.countryList,
      mutationResult: value,
      isError: state.isError,
    );
  }
}
