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
      hintStyle: bodyLarge?.copyWith(
        color: AuthColorPalette.bodyTextColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      hintText: hintText,
      prefixIconColor: AuthColorPalette.bodyTextColor,
      prefixIcon: prefixIcon,
      prefixIconConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),

      filled: true,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(99.r),
        borderSide: BorderSide(color: borderColor == false ? Colors.transparent : AuthColorPalette.greyscale300) ,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(99.r),
        borderSide: BorderSide(color: borderColor == false ? Colors.transparent : Color(0xFF6A42C2)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(99.r),
        borderSide: BorderSide(color: borderColor == false ? Colors.transparent : Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(99.r),
        borderSide: BorderSide(color: borderColor == false ? Colors.transparent : AuthColorPalette.greyscale300),
      ),
    );
  }
}
