import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../components/empty_widget.dart';
import '../controllers/graphql_controller.dart';

class GraphQLView extends GetView<GraphQLController> {
  const GraphQLView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL'),
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
                  child: ListView.separated(
                    itemCount: controller.albumList.length,
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
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.primaryColor.withOpacity(.3),
                                  blurRadius: 7.0,
                                  spreadRadius: 4,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: [
                              Text(
                                controller.albumList[index]["title"] ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: MyFonts.headline6TextSize,
                                  fontWeight: FontWeight.w500,
                                  color: theme.primaryColor,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                height: 150.h,
                                width: 150.w,
                                child: Image.network(
                                  controller.albumList[index]["photos"]["data"]
                                      [0]["thumbnailUrl"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
