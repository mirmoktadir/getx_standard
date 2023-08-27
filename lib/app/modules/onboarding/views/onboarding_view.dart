import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/global-widgets/my_buttons.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectedPage,
              itemCount: controller.onBoardingPages.length,
              itemBuilder: (context, index) {
                return controller.onBoardingPages.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: theme.primaryColor,
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 150.h),
                          Container(
                            height: 200.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  controller.onBoardingPages[index].imageAsset),
                              fit: BoxFit.cover,
                            )),
                          ),
                          SizedBox(
                            height: 40.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 30.sp),
                                SizedBox(
                                  width: 300.w,
                                  child: Text(
                                    controller.onBoardingPages[index].title,
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 1.4,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  controller.onBoardingPages[index].description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: theme.hintColor,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              },
            ),
            Positioned(
              bottom: 100.h,
              left: 150.w,
              child: Row(
                children: List.generate(
                  controller.onBoardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      height: 4,
                      width: 15,
                      decoration: BoxDecoration(
                        color: controller.selectedPage.value == index
                            ? theme.primaryColor
                            : theme.primaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(30.r),
                        shape: BoxShape.rectangle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 40.sp,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80.sp,
                      height: 40.sp,
                      child: PrimaryButton(
                        title: 'Skip',
                        onPressed: () {
                          Get.offAllNamed(Routes.NAV);
                        },
                        inactive: false,
                      ),
                    ),
                    SizedBox(
                      width: 80.sp,
                      height: 40.sp,
                      child: PrimaryButton(
                        title: 'Next',
                        onPressed: () {
                          if (controller.selectedPage.value >
                              controller.onBoardingPages.length - 2) {
                            Get.offAllNamed(Routes.NAV);
                          } else {
                            controller.forwardAction();
                          }
                        },
                        inactive: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
