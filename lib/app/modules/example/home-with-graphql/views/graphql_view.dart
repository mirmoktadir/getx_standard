import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/my_buttons.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../config/theme/my_fonts.dart';
import '../../../../../config/theme/my_theme.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../controllers/graphql_controller.dart';

class GraphQLView extends GetView<GraphQLController> {
  const GraphQLView({super.key});

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
              onPressed: () => controller.navController.selectedIndex.value = 0,
              icon: const Icon(
                IconlyBold.home,
                color: Colors.white,
              )),
        ],
        centerTitle: true,
      ),
      body: Obx(() => controller.isError.value == true
          ? EmptyWidget(onPressed: () async => await controller.getAlbums())
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async => await controller.getAlbums(),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RawScrollbar(
                  thumbColor: theme.primaryColor,
                  radius: const Radius.circular(100),
                  thickness: 5,
                  interactive: true,
                  child: Column(
                    children: [
                      SizedBox(
                          width: 150.sp,
                          height: 48.sp,
                          child: PrimaryButton(
                              title: "Run mutation",
                              onPressed: () async =>
                                  await controller.updateTodo(),
                              inactive: false)),
                      SizedBox(height: 10.h),
                      controller.mutationResult.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                  "RESULT :${controller.mutationResult.value}"),
                            ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: controller.userList.length,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          separatorBuilder: (_, __) => SizedBox(
                            height: 20.h,
                          ),
                          itemBuilder: (ctx, index) => Container(
                            padding: const EdgeInsets.all(5),
                            width: double.infinity,
                            color: theme.canvasColor,
                            child: Center(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            theme.primaryColor.withOpacity(.3),
                                        blurRadius: 7.0,
                                        spreadRadius: 4,
                                        offset: const Offset(0, 3),
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    controller.userList[index]["name"] ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: MyFonts.headline6TextSize,
                                      fontWeight: FontWeight.w500,
                                      color: theme.primaryColor,
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
                ),
              ),
            )),
    );
  }
}
