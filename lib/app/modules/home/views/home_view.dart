import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 2,
        separatorBuilder: (_, __) => SizedBox(
          height: 10.h,
        ),
        itemBuilder: (ctx, index) => Row(
          children: [
            SizedBox(
              width: 300.w,
              child: const ListTile(
                title: Text("Hello"),
                subtitle: Text('category'),
              ),
            ),
            SizedBox(
              width: 60.w,
              child: const Image(
                image: NetworkImage('image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
