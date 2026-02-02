import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_standard/app/components/global-widgets/splash_container.dart';
import 'package:getx_standard/config/theme/dark_theme_colors.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../config/theme/my_theme.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../../../../components/global-widgets/main_appbar.dart';
import '../../../../components/global-widgets/network_image_box.dart';
import '../../../../data/local/my_shared_pref.dart';
import '../../../../providers/home_provider.dart';
import '../../../../providers/theme_provider.dart';
import '../../../../providers/navbar_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      appBar: MainAppBar(
        prefixAction: () => toggleTheme(ref),
        suffixAction: () => setNavbarIndex(ref, 1),
      ),
      body: homeState.isError
          ? EmptyWidget(
              onPressed: () async =>
                  await ref.read(homeProvider.notifier).getRecipes(),
            )
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async =>
                  await ref.read(homeProvider.notifier).getRecipes(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.sp, 18.sp, 18.sp, 18.sp),
                child: GridView.builder(
                  itemCount: homeState.recipes.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  controller: homeState.scrollController,
                  itemBuilder: (context, index) => Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SplashContainer(
                            radius: 15,
                            onPressed: () {},
                            child: Container(
                              width: 150.sp,
                              height: 170.sp,
                              padding: EdgeInsets.fromLTRB(
                                10.sp,
                                46.sp,
                                10.sp,
                                12.sp,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: MySharedPref.getThemeIsLight()
                                    ? Colors.white
                                    : Colors.orange.withOpacity(.1),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0, end: 1),
                                    duration: const Duration(
                                      milliseconds: 1500,
                                    ),
                                    builder:
                                        (
                                          BuildContext context,
                                          double value,
                                          Widget? child,
                                        ) {
                                          return Opacity(
                                            opacity: value,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                top: value * 18.r,
                                              ),
                                              child: child,
                                            ),
                                          );
                                        },
                                    child: Text(
                                      homeState.recipes[index].name ?? "",
                                      style: theme.textTheme.titleLarge,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${homeState.recipes[index].prepTimeMinutes ?? ""} Mins",
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(
                                        height: 30.sp,
                                        width: 30.sp,
                                        child: SplashContainer(
                                          radius: 100,
                                          onPressed: () {},
                                          child: Icon(
                                            Iconsax.save_add,
                                            size: 16.sp,
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 30.sp,
                        child: SizedBox(
                          height: 100.sp,
                          width: 100.sp,
                          child: NetworkImageBox(
                            url: homeState.recipes[index].thumbnailUrl ?? "",
                            radius: 100,
                            height: 100.sp,
                            width: 100.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10.sp,
                        top: 55.sp,
                        child: Container(
                          height: 28.sp,
                          width: 58.sp,
                          padding: EdgeInsets.symmetric(horizontal: 8.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: const Color(0xffFFE1B3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color(0xffFFAD30),
                                size: 18.sp,
                              ),
                              Text(
                                homeState.recipes[index].userRatings!.score!
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                  color: theme.brightness == Brightness.dark
                                      ? DarkThemeColors.scaffoldBackgroundColor
                                      : LightThemeColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                ),
              ),
            ),
    );
  }
}
