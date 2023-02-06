import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'animations/error.json',
            height: 120.h,
            repeat: true,
            reverse: true,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              "Empty or No data !",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: theme.hintColor.withOpacity(.5),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 46.h,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade50,
                  elevation: .5,
                  shadowColor: theme.hintColor,
                ),
                child: Icon(
                  Ionicons.refresh,
                  size: 24,
                  color: theme.primaryColor.withOpacity(.7),
                )),
          )
        ],
      ),
    );
  }
}
