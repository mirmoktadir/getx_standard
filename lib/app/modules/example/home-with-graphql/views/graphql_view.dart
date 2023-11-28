import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/components/global-widgets/main_appbar.dart';
import 'package:getx_standard/app/components/global-widgets/my_buttons.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../config/theme/my_theme.dart';
import '../../../../components/global-widgets/empty_widget.dart';
import '../controllers/graphql_controller.dart';

class GraphQLView extends GetView<GraphQLController> {
  const GraphQLView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: MainAppBar(
        prefixAction: () => MyTheme.changeTheme(),
        suffixAction: () => controller.navController.selectedIndex.value = 0,
      ),
      body: Obx(() => controller.isError.value == true
          ? EmptyWidget(onPressed: () async => await controller.getTodos())
          : RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async {
                controller.mutationResult.value = "";
                await controller.getTodos();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RawScrollbar(
                  thumbColor: theme.primaryColor,
                  radius: const Radius.circular(100),
                  thickness: 5,
                  interactive: true,
                  child: controller.queryResult.isEmpty
                      ? const SizedBox()
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              controller.mutationResult.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 30.sp),
                                      child: SizedBox(
                                        width: 150.sp,
                                        height: 48.sp,
                                        child: PrimaryButton(
                                            title: "Run mutation",
                                            onPressed: () async =>
                                                await controller.updateTodo(),
                                            inactive: false),
                                      ),
                                    )
                                  : const SizedBox(),
                              SizedBox(height: 10.h),
                              controller.mutationResult.isEmpty
                                  ? const SizedBox()
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.h),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Mutation result",
                                                style: theme
                                                    .textTheme.headlineSmall,
                                              ),
                                              SizedBox(height: 20.sp),
                                              Text(
                                                controller.mutationResult.value,
                                                style:
                                                    theme.textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20.sp),
                                          Container(
                                            height: 35.sp,
                                            width: 35.sp,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              color: theme.primaryColor
                                                  .withOpacity(.8),
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  controller.mutationResult
                                                      .value = "";
                                                },
                                                icon: const Icon(
                                                  Iconsax.refresh,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                  height: controller.mutationResult.isEmpty
                                      ? 60.h
                                      : 50.h),
                              Text(
                                "Query result",
                                style: theme.textTheme.headlineSmall,
                              ),
                              SizedBox(height: 20.sp),
                              Text(
                                controller.queryResult.value,
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 200)
                            ],
                          ),
                        ),
                ),
              ),
            )),
    );
  }
}
