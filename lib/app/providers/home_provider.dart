import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/global-widgets/my_snackbar.dart';
import '../data/local/hive/my_hive.dart';
import '../modules/example/home-with-restAPI/model/recipes_model.dart';
import '../service/REST/api_urls.dart';
import '../service/REST/dio_client.dart';
import '../service/handler/exception_handler.dart';
import '../service/helper/network_connectivity.dart';



final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);

class HomeState {
  final List<Results> recipes;
  final bool isError;
  final double bottomPadding;
  final ScrollController scrollController;
  final String title;
  final String body;

  HomeState({
    this.recipes = const [],
    this.isError = false,
    double? bottomPadding,
    ScrollController? scrollController,
    this.title = '',
    this.body = '',
  }) : bottomPadding = bottomPadding ?? 18.sp,
       scrollController = scrollController ?? ScrollController();
}

class HomeNotifier extends Notifier<HomeState> with ExceptionHandler {
  Timer? _debounce;

  @override
  HomeState build() {
    final scrollController = ScrollController();
    ref.onDispose(() {
      _debounce?.cancel();
      scrollController.dispose();
    });
    _scrollPositionTracker(scrollController);
    Future.microtask(() => getRecipes());
    return HomeState(scrollController: scrollController, title: '', body: '');
  }

  void _scrollPositionTracker(ScrollController scrollController) {
    scrollController.addListener(() {
      if (_debounce != null && _debounce!.isActive) {
        _debounce!.cancel();
      }
      _debounce = Timer(const Duration(milliseconds: 200), () {
        if (scrollController.hasClients) {
          if (scrollController.position.pixels >
              scrollController.position.minScrollExtent + 5) {
            state = HomeState(
              recipes: state.recipes,
              isError: state.isError,
              bottomPadding: 18.sp,
              scrollController: state.scrollController,
              title: state.title,
              body: state.body,
            );
          }
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent) {
            state = HomeState(
              recipes: state.recipes,
              isError: state.isError,
              bottomPadding: 130.sp,
              scrollController: state.scrollController,
              title: state.title,
              body: state.body,
            );
          }
        }
      });
    });
  }

  Future<void> getRecipes() async {
    showLoading(ref);
    if (await NetworkConnectivity.isNetworkAvailable()) {
      final response = await DioClient().get(url: ApiUrl.allRecipes).catchError(
        (e) {
          handleError(ref, e);
          state = HomeState(
            recipes: state.recipes,
            isError: true,
            bottomPadding: state.bottomPadding,
            scrollController: state.scrollController,
            title: state.title,
            body: state.body,
          );
          return null;
        },
      );

      if (response == null) return;

      final list = (response["results"] as List)
          .map((e) => Results.fromJson(e))
          .toList();

      await MyHive.saveAllRecipes(list);
      hideLoading(ref);
      state = HomeState(
        recipes: list,
        isError: false,
        bottomPadding: state.bottomPadding,
        scrollController: state.scrollController,
        title: state.title,
        body: state.body,
      );
    } else {
      final savedRecipes = MyHive.getAllRecipes();
      if (savedRecipes.isNotEmpty) {
        hideLoading(ref);
        MySnackBar.showErrorToast(message: "No network!");
        NetworkConnectivity.connectionChangeCount = 1;
        state = HomeState(
          recipes: savedRecipes,
          isError: false,
          bottomPadding: state.bottomPadding,
          scrollController: state.scrollController,
          title: state.title,
          body: state.body,
        );
      } else {
        NetworkConnectivity.connectionChangeCount = 1;
        hideLoading(ref);
        showErrorDialog(ref, "Oops!", "Connection problem");
        state = HomeState(
          recipes: state.recipes,
          isError: true,
          bottomPadding: state.bottomPadding,
          scrollController: state.scrollController,
          title: state.title,
          body: state.body,
        );
      }
    }
  }

  void setTitle(String title) {
    state = HomeState(
      recipes: state.recipes,
      isError: state.isError,
      bottomPadding: state.bottomPadding,
      scrollController: state.scrollController,
      title: title,
      body: state.body,
    );
  }

  void setBody(String body) {
    state = HomeState(
      recipes: state.recipes,
      isError: state.isError,
      bottomPadding: state.bottomPadding,
      scrollController: state.scrollController,
      title: state.title,
      body: body,
    );
  }

  void setBottomPadding(double value) {
    state = HomeState(
      recipes: state.recipes,
      isError: state.isError,
      bottomPadding: value,
      scrollController: state.scrollController,
      title: state.title,
      body: state.body,
    );
  }
}
