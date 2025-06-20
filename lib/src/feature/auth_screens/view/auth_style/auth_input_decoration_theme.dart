import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_color_pallete.dart';

class AuthInputDecorationTheme {
  static InputDecoration lightInputDecorationTheme({
    required BuildContext context,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? fillColor,
    bool? borderColor,
  }) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return InputDecoration(
      suffixIcon: suffixIcon,
      hintStyle: bodyLarge?.copyWith(color: AppColors.onSecondary),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      hintText: hintText,
      prefixIconColor: AppColors.onSurface,
      prefixIcon: prefixIcon,
      prefixIconConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),

      filled: true,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color:
              borderColor == false ? Colors.transparent : AppColors.onSecondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: borderColor == false ? Colors.transparent : AppColors.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: borderColor == false ? Colors.transparent : Colors.red,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color:
              borderColor == false ? Colors.transparent : AppColors.onSecondary,
        ),
      ),
    );
  }
}
