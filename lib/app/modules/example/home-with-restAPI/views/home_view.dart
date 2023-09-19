import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/splash_container.dart';
import 'package:iconly/iconly.dart';

import '../../../../../config/theme/my_fonts.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../../../../components/global-widgets/network_image_box.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasty'),
        actions: [
          IconButton(
              onPressed: () => controller.navController.selectedIndex.value = 1,
              icon: const Icon(
                IconlyBold.graph,
                color: Colors.white,
              )),
        ],
        centerTitle: true,
      ),
      body: Obx(() => controller.isError.value == true
          ? EmptyWidget(onPressed: () async => await controller.getRecipes())
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async => await controller.getRecipes(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1000),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Opacity(
                        opacity: value,
                        child: Padding(
                          padding: EdgeInsets.only(top: value * 18.r),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      "GetX Standard",
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                    child: RawScrollbar(
                      thumbColor: theme.primaryColor,
                      radius: Radius.circular(100.r),
                      thickness: 5,
                      interactive: true,
                      child: Padding(
                        padding: EdgeInsets.all(18.r),
                        child: ListView.separated(
                          itemCount: controller.recipes.length,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          separatorBuilder: (_, __) => SizedBox(
                            height: 20.h,
                          ),
                          itemBuilder: (ctx, index) => SplashContainer(
                            radius: 15,
                            onPressed: () {},
                            child: SizedBox(
                              height: 110.sp,
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SplashContainer(
                                      radius: 15,
                                      onPressed: () {},
                                      child: NetworkImageBox(
                                        url: controller
                                                .recipes[index].thumbnailUrl ??
                                            "",
                                      ),
                                    ),
                                    SizedBox(width: 10.sp),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.recipes[index].name ??
                                                "",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize:
                                                  MyFonts.headline5TextSize,
                                              fontWeight: FontWeight.w500,
                                              color: theme.primaryColor,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Flexible(
                                            child: Text(
                                              controller.recipes[index]
                                                      .description ??
                                                  "No description",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize:
                                                    MyFonts.headline6TextSize,
                                                fontWeight: FontWeight.w400,
                                                color: theme.hintColor,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
