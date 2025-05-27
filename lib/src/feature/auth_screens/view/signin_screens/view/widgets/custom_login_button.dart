import 'package:car_wash/src/common_widget_style/common_style/auth_style/auth_color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildLoginButton({
  required BuildContext context,
  required String imagePath,
  required String title,
}) {
  final bodyLarge = Theme.of(context).textTheme.bodyLarge;

  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: AuthColorPalette.greyscale200),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(imagePath, width: 24.w, height: 24.h),
        SizedBox(width: 8.w),
        Text(
          title,
          style: bodyLarge?.copyWith(color: AuthColorPalette.titleColor),
        ),
      ],
    ),
  );
}
