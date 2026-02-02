import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/home_provider.dart';

class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(homeState.title, style: theme.textTheme.headlineSmall),
            SizedBox(height: 40.h),
            Text(homeState.body, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
