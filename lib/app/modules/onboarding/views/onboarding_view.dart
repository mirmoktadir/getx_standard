import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/global-widgets/my_buttons.dart';
import '../../../core/app_router.dart';
import '../../../providers/onboarding_provider.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingState.pageController,
            onPageChanged: (index) => notifier.setSelectedPage(index),
            itemCount: onboardingState.onBoardingPages.length,
            itemBuilder: (context, index) {
              return onboardingState.onBoardingPages.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: theme.primaryColor,
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 100.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.sp),
                          child: SizedBox(
                            width: 300.w,
                            child: Text(
                              onboardingState.onBoardingPages[index].title,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.4,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.sp),
                        Container(
                          height: 200.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                onboardingState
                                    .onBoardingPages[index]
                                    .imageAsset,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.sp),
                        SizedBox(
                          width: 300.w,
                          child: Text(
                            onboardingState.onBoardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: theme.hintColor,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
          Positioned(
            bottom: 130.h,
            left: 160.w,
            child: Row(
              children: List.generate(
                onboardingState.onBoardingPages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 4,
                  width: 20.sp,
                  decoration: BoxDecoration(
                    color: onboardingState.selectedPage == index
                        ? theme.primaryColor
                        : theme.primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(30.r),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.sp,
            right: 0,
            child: SizedBox(
              width: 80.sp,
              height: 40.sp,
              child: TextButton(
                onPressed: () {
                  context.go(AppRoutes.floatingNav);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
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
                  onboardingState.selectedPage > 0
                      ? SizedBox(
                          width: 80.sp,
                          height: 40.sp,
                          child: PrimaryButton(
                            title: 'Prev',
                            onPressed: notifier.backwardAction,
                            inactive: false,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: 80.sp,
                    height: 40.sp,
                    child: PrimaryButton(
                      title:
                          onboardingState.selectedPage >
                              onboardingState.onBoardingPages.length - 2
                          ? "Go!"
                          : "Next",
                      onPressed: () {
                        if (onboardingState.selectedPage >
                            onboardingState.onBoardingPages.length - 2) {
                          context.go(AppRoutes.floatingNav);
                        } else {
                          notifier.forwardAction();
                        }
                      },
                      inactive: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
