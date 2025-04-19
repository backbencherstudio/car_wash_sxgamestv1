import 'package:car_wash/core/constant/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_style/timeline_style/timeline_color.dart';

class CommonWidgets {
  /// App primary button
  static Widget primaryButton({
    required BuildContext context,
    required String title,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    EdgeInsets? padding,
  })
  {
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
  })
  {

    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Image.asset(
          imgPath,
          height: imageSize?.height ?? 20.h,

          width: imageSize?.width ??  20.w,
        fit: BoxFit.cover,
          color: color,

        ),
      ),
    );
  }

  static Widget customAppBar({
    required BuildContext context,
    String? leadingImagePath,
    Size? leadingImageSize,
    Function? leadingButtonOnTap,
    required String title,
    required Color titleColor,
    String? subtitle,
    String? subtitleImagePath,
    Size? subtitleImageSize,
    Color? subtitleColor,
    Color? leadingBgColor,
    bool? centerTitle = false,
    Widget? actionWidgets,
    EdgeInsets? margin,
    void Function()? onTap
    
  })
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: centerTitle,
        elevation: 0,
        leading:
            leadingImagePath != null
                ? GestureDetector(
                  onTap: () {
                    leadingButtonOnTap;
                  },
                  child: Container(
                    margin: margin ?? EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: leadingBgColor?? Colors.transparent,
                    ),
                    child: GestureDetector(
                      onTap: onTap,
                      child: Image.asset(
                        leadingImagePath,
                        width: leadingImageSize?.width ?? 14.w,
                        height: leadingImageSize?.height ?? 14.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                : null,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
            if (subtitle != null)
              Row(
                children: [
                  if (subtitleImagePath != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          subtitleImagePath,
                          width: subtitleImageSize?.width ?? 14.w,
                          height: subtitleImageSize?.height ?? 14.h,

                        ),
                        SizedBox(width: 4.w),
                      ],
                    ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: subtitleColor ?? Colors.white,
                    ),
                  ),
                ],
              ),
          ],
        ),

        actions: [if (actionWidgets != null) actionWidgets],
      ),
    );
  }


  /// Confirmation dialog, when call, will open a bottom sheet
  static Future<bool> customConfirmationBottomSheet({
    required BuildContext context,
    String? iconPath,
    String? bodyText,
    required String confirmButtonText,
    String? headerText,
    Function? onCancel,
    required Function onConfirm,
    Color? confirmationButtonColor,
    Color? iconColor,
    Widget? bodyWidget,
    double? maxBottomSheetHeight
  }) async
  {
    bool isConfirm = false;
    var value = await showModalBottomSheet(
      useSafeArea: true,
      constraints: BoxConstraints(maxHeight: maxBottomSheetHeight ?? 350.h),
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 20.h,
            top: 12.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: TimelineColor.iconColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 25.h),

              bodyWidget ??
              Column(
                children: [
                  Image.asset(
                    iconPath ?? "Icons.question_answer",
                    color: iconColor,
                    fit: BoxFit.contain,
                    width: 72.w,
                    height: 72.h,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    headerText ?? "Are You Sure?",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: TimelineColor.textColor,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    bodyText ?? "",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: TimelineColor.lightTextColor,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 35.h),
              Expanded(
                child: Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: primaryButton(
                        context: context,
                        title: "Cancel",
                        color:
                        confirmationButtonColor ??
                            TimelineColor.secondaryColor,
                        textColor: TimelineColor.textColor,
                        onPressed: () {
                          isConfirm = false;
                          onCancel ?? Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: primaryButton(
                        context: context,
                        title: confirmButtonText,
                        color: TimelineColor.primaryColor,
                        textColor: TimelineColor.onPrimaryColor,
                        onPressed: () {
                          isConfirm = true;
                          onConfirm();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    return isConfirm;
  }




}
