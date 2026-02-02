import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../modules/onboarding/model/on_boarding_model.dart';

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );

class OnboardingState {
  final int selectedPage;
  final PageController pageController;
  final List<OnBoardingModel> onBoardingPages;

  OnboardingState({
    this.selectedPage = 0,
    PageController? pageController,
    List<OnBoardingModel>? onBoardingPages,
  }) : pageController = pageController ?? PageController(),
       onBoardingPages = onBoardingPages ?? _defaultPages;
}

final _defaultPages = [
  OnBoardingModel(
    imageAsset: Onboarding.kBoard1,
    title: 'Flutter and Riverpod: Empowering Efficient Development.',
    description:
        'Riverpod: A concise Flutter library for efficient state management and navigation, enhancing app development.',
  ),
  OnBoardingModel(
    imageAsset: Onboarding.kBoard2,
    title:
        'Flutter supports both REST and GraphQL for handling API requests in your applications.',
    description:
        'Get Strong and smart client and error handling for both REST and GraphQL with Riverpod.',
  ),
];

class OnboardingNotifier extends Notifier<OnboardingState> {
  Timer? _autoScrollTimer;
  static const _autoScrollDuration = Duration(seconds: 4);

  @override
  OnboardingState build() {
    final pageController = PageController();
    ref.onDispose(() {
      _autoScrollTimer?.cancel();
      pageController.dispose();
    });
    _startAutoScroll(pageController);
    return OnboardingState(
      pageController: pageController,
      onBoardingPages: _defaultPages,
    );
  }

  void _startAutoScroll(PageController pageController) {
    _autoScrollTimer = Timer.periodic(_autoScrollDuration, (timer) {
      if (state.selectedPage < state.onBoardingPages.length - 1) {
        final next = state.selectedPage + 1;
        state = OnboardingState(
          selectedPage: next,
          pageController: state.pageController,
          onBoardingPages: state.onBoardingPages,
        );
        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _autoScrollTimer?.cancel();
      }
    });
  }

  void setSelectedPage(int index) {
    state = OnboardingState(
      selectedPage: index,
      pageController: state.pageController,
      onBoardingPages: state.onBoardingPages,
    );
  }

  void forwardAction() {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void backwardAction() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
