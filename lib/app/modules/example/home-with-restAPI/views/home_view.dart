import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/splash_container.dart';
import 'package:getx_standard/config/theme/dark_theme_colors.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../config/theme/my_theme.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../../../../components/global-widgets/network_image_box.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Standard'),
        leading: IconButton(
          onPressed: () => MyTheme.changeTheme(),
          icon: Icon(
            Get.isDarkMode ? Iconsax.moon5 : Iconsax.sun5,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.navController.selectedIndex.value = 1,
            icon: const Icon(
              IconlyBold.graph,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isError.value == true
            ? EmptyWidget(onPressed: () async => await controller.getRecipes())
            : RefreshIndicator(
                color: theme.primaryColor,
                onRefresh: () async => await controller.getRecipes(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      18.sp, 18.sp, 18.sp, controller.bottomPadding.value),
                  child: GridView.builder(
                    itemCount: controller.recipes.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    controller: controller.scrollController,
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
                                      10.sp, 46.sp, 10.sp, 12.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Colors.grey.shade200
                                          .withOpacity(0.5)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TweenAnimationBuilder(
                                        tween: Tween<double>(begin: 0, end: 1),
                                        duration:
                                            const Duration(milliseconds: 1500),
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return Opacity(
                                            opacity: value,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: value * 18.r),
                                              child: child,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          controller.recipes[index].name ?? "",
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
                                            "${controller.recipes[index].prepTimeMinutes ?? ""} Mins",
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
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        Positioned(
                          top: 30.sp,
                          child: SizedBox(
                            height: 100.sp,
                            width: 100.sp,
                            child: NetworkImageBox(
                              url: controller.recipes[index].thumbnailUrl ?? "",
                              radius: 100,
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
                                  controller.recipes[index].userRatings!.score!
                                      .toStringAsFixed(1),
                                  style: TextStyle(
                                    color: Get.isDarkMode
                                        ? DarkThemeColors
                                            .scaffoldBackgroundColor
                                        : LightThemeColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
