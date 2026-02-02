import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../../modules/example/home-with-graphql/views/graphql_view.dart';
import '../../modules/example/home-with-restAPI/views/home_view.dart';
import '../../providers/navbar_provider.dart';

class FixedBottomNavbar extends ConsumerWidget {
  const FixedBottomNavbar({super.key});

  static final _navigation = [const HomeView(), const GraphQLView()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    final selectedIndex = ref.watch(navbarSelectedIndexProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: _navigation[selectedIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80.h,
        color: theme.primaryColor,
        padding: EdgeInsets.only(bottom: 18.sp, left: 18.sp, right: 18.sp),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 75.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                index: 0,
                selectedIndex: selectedIndex,
                iconBold: IconlyBold.home,
                iconLight: IconlyLight.home,
                onTap: () => setNavbarIndex(ref, 0),
              ),
              _NavItem(
                index: 1,
                selectedIndex: selectedIndex,
                iconBold: IconlyBold.graph,
                iconLight: IconlyLight.graph,
                onTap: () => setNavbarIndex(ref, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.selectedIndex,
    required this.iconBold,
    required this.iconLight,
    required this.onTap,
  });

  final int index;
  final int selectedIndex;
  final IconData iconBold;
  final IconData iconLight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
          width: 40.w,
          child: IconButton(
            hoverColor: Colors.transparent,
            onPressed: onTap,
            icon: Icon(
              selectedIndex == index ? iconBold : iconLight,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
        ),
        SizedBox(height: 2.sp),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedIndex == index ? Colors.white : Colors.transparent,
          ),
        ),
      ],
    );
  }
}
