import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_standard/app/components/global-widgets/main_appbar.dart';

import '../../../../components/global-widgets/empty_widget.dart';
import '../../../../providers/graphql_provider.dart';
import '../../../../providers/navbar_provider.dart';
import '../../../../providers/theme_provider.dart';

class GraphQLView extends ConsumerWidget {
  const GraphQLView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    final graphqlState = ref.watch(graphqlProvider);

    return Scaffold(
      appBar: MainAppBar(
        prefixAction: () => toggleTheme(ref),
        suffixAction: () => setNavbarIndex(ref, 0),
      ),
      body: graphqlState.isError
          ? EmptyWidget(
              onPressed: () async =>
                  await ref.read(graphqlProvider.notifier).getCountries(),
            )
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async {
                ref.read(graphqlProvider.notifier).setMutationResult("");
                await ref.read(graphqlProvider.notifier).getCountries();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RawScrollbar(
                  thumbColor: theme.primaryColor,
                  radius: const Radius.circular(100),
                  thickness: 5,
                  interactive: true,
                  child: graphqlState.countryList.isEmpty
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Text(
                              "Query result",
                              style: theme.textTheme.headlineSmall,
                            ),
                            SizedBox(height: 20.sp),
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                        width: 1,
                                        color: theme.primaryColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 50.sp,
                                        vertical: 15.sp,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            graphqlState
                                                    .countryList[index]
                                                    .name ??
                                                "",
                                            style: theme.textTheme.bodyLarge,
                                          ),
                                          Text(
                                            graphqlState
                                                    .countryList[index]
                                                    .emoji ??
                                                "",
                                            style: theme.textTheme.displayLarge,
                                          ),
                                          Text(
                                            graphqlState
                                                    .countryList[index]
                                                    .code ??
                                                "",
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: graphqlState.countryList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return SizedBox(height: 12.sp);
                                    },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
    );
  }
}
