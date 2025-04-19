import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Utils {
  static Widget customAppBar({
    String? leadingImageAddress,
    String? title,
    String? subtitle,
    String? subtitlePreIconAsset,
    List<Widget>? trailing,
    Border? appBarBgColor,
    required BuildContext context,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 64.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(16.r),
        border: appBarBgColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 33,
            color: const Color(0xff000000).withOpacity(0.1),
            offset: const Offset(1, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Leading: custom widget or image
          leadingImageAddress != null
              ? Container(
                height: 44.w,
                width: 44.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.2),
                  image: DecorationImage(
                    image: NetworkImage(leadingImageAddress),
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : SizedBox(),

          SizedBox(width: 12.w),

          // Title and subtitle section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                if (subtitle != null)
                  Row(
                    children: [
                      if (subtitlePreIconAsset != null)
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: SvgPicture.asset(
                            subtitlePreIconAsset,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      Text(
                        subtitle,
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Trailing actions
          if (trailing != null)
            Row(mainAxisSize: MainAxisSize.min, children: trailing),
        ],
      ),
    );
  }

  static Widget primaryButton({
    required VoidCallback onPressed,
    required String text,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }

  static Widget secondaryButton({
    required VoidCallback onPressed,
    required String imageAsset,
    String? buttonName,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? height,
    double? width,
    BorderRadius? borderRadius,
    required BuildContext context,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          height: height ??72.w,
          width: width??74.w,
          padding: EdgeInsets.symmetric(horizontal: 16.2.w, vertical: 17.1.h),
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            color: backgroundColor ?? colorScheme.surface.withOpacity(0.08),
          ),
          child: SvgPicture.asset(imageAsset),
        ),
        if (buttonName != null) ...[SizedBox(height: 12.h), Text(buttonName,style: textTheme.bodySmall,)],
      ],
    );
  }

  static AppBar appBarBackButton(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: ImageIcon(AssetImage('assets/icons/back.png',),size: 26.r, ),
      ),

      ///size: 20.r
    );
  }
}


