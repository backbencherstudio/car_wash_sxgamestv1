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
    ColorScheme colorScheme =Theme.of(context).colorScheme;
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
                    style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600,color: colorScheme.primary),
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
                        style: textTheme.bodyMedium!.copyWith(color: colorScheme.onSurface)
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
}
