import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonWidgets {
  /// App primary button
  static Widget primaryButton({
    required BuildContext context,
    required String title,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    EdgeInsets? padding,
  }) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          backgroundColor: color,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          title,
          style: bodyLarge?.copyWith(
            color:
                textColor, //color == Color(0xFF6A42C2) ?  Color(0xFFFFFFFF) : Color(0xFF1D1F2C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget circleButton({
    required String imgPath,
    required Function onTap,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Size? imageSize,
    Color? color,
  }) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Image.asset(
          imgPath,
          height: imageSize?.height ?? 20.h,

          width: imageSize?.width ?? 20.w,
          fit: BoxFit.cover,
          color: color,
        ),
      ),
    );
  }
}
