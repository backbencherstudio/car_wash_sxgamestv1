import 'package:car_wash/core/constant/icons.dart';
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
    return SafeArea(
      child: Container(
        //height: 64.h,
        padding: EdgeInsets.all(10.r),
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
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Leading: custom widget or image
            leadingImageAddress != null
                ? Container(
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.2),
                    image: DecorationImage(
                      image: AssetImage(leadingImageAddress),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                : SizedBox(),

            SizedBox(width: 12.w),

            // Title and subtitle section
            if(title != null || subtitle != null)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
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
                              colorFilter: ColorFilter.mode(
                                AppColors.onSurface,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        Text(
                          subtitle,
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // Trailing actions
            if (trailing != null)
              Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, children: trailing),
          ],
        ),
      ),
    );
  }

  static Widget primaryButton({
    required VoidCallback? onPressed,
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
    EdgeInsets? padding,
    String? buttonName,
    Color? backgroundColor,
    TextStyle? buttonNameTextStyle,
    double? height,
    double? width,
    BorderRadius? borderRadius,
    required BuildContext context,
    Color? iconColor,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          //  height: height ??72.w,
          //  width: width??74.w,
          padding:
              padding ??
              EdgeInsets.symmetric(horizontal: 16.2.w, vertical: 17.1.h),
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
            color: backgroundColor ?? colorScheme.surface.withOpacity(0.08),
          ),
          child: SvgPicture.asset(
            imageAsset,
            colorFilter: ColorFilter.mode(
              iconColor ?? colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        if (buttonName != null) ...[
          SizedBox(height: 12.h),
          Text(buttonName, style: buttonNameTextStyle ?? textTheme.bodySmall),
        ],
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
        // icon: ImageIcon(AssetImage('assets/icons/back.png',),size: 26.r, ),
        icon: SvgPicture.asset(
          AppIcons.BackButton,

          color: Color(0xff000000),

          height: 24,
          width: 24,
        ),
      ),

      ///size: 20.r
    );
  }

  static Decoration commonBoxDecoration({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? shadowColor,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? Color.fromRGBO(0, 0, 0, 0.02),
          blurRadius: 10.r,
          spreadRadius: 10.r,
          offset: Offset(4, 4),
        ),
      ],
    );
  }

  static Container appBarButtons({Color? buttonColor, Color? backgroundColor}) {
    return Container(
      height: 64.h,
      width: 112.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: backgroundColor ?? const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.04),
            offset: const Offset(0, 4),
            blurRadius: 33,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: buttonColor ?? const Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset("assets/icons/notification.svg"),
              ),
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset("assets/icons/menu.svg"),
          ],
        ),
      ),
    );
  }
}
