import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';

import '../../../config/theme/light_theme_colors.dart';
import '../../../utils/constants.dart';
import '../../components/global-widgets/my_buttons.dart';

class DialogHelper {
  static void showErrorDialog(
    BuildContext context,
    String title,
    String description,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        elevation: 6,
        shadowColor: Colors.black12.withValues(alpha: .2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SizedBox(
            width: 200.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                Icon(Remix.error_warning_fill, color: Colors.red, size: 60.sp),
                SizedBox(height: 15.sp),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 15.sp),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      description,
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium as TextStyle,
                      textAlign: TextAlign.center,
                      colors: [
                        Colors.white,
                        Colors.red.shade50,
                        Colors.redAccent.shade100,
                        Colors.white,
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showDownloadDialog(
    BuildContext context,
    String fileName,
    dynamic onPressed,
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.black12.withValues(alpha: .2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SizedBox(
            width: 350.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Download PDF?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: LightThemeColors.bodyTextColor,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
                Text(
                  fileName,
                  style: TextStyle(
                    color: LightThemeColors.bodyTextSecondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 8.sp),
                Text(
                  "Download the PDF of this conversation?",
                  style: TextStyle(
                    color: LightThemeColors.bodyTextSecondaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.sp,
                      width: 100.sp,
                      child: SecondaryButton(
                        title: "Cancel",
                        onPressed: () => Navigator.of(context).pop(),
                        inactive: false,
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    SizedBox(
                      height: 40.sp,
                      width: 100.sp,
                      child: PrimaryButton(
                        title: "Download",
                        onPressed: onPressed,
                        inactive: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> showLoading(BuildContext context) async {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
      builder: (context) => Center(
        child: Container(
          height: 80.h,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.kLoaderIcon),
                  ),
                ),
              ),
              SizedBox(
                height: 60.sp,
                width: 60.sp,
                child: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> hideLoading(BuildContext context) async {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
