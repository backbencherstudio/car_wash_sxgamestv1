import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/src/feature/service_booking_screens/view/widgets/selection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customSelectionWidget({
  required BuildContext context,
  required String headingText,
  required String firstLeadingIconPath,
  required String firstBodyText,
  required String secondLeadingIconPath,
  required String secondBodyText,
  required bool isFirstOneActive,
  required VoidCallback  firstOneTap,
  required VoidCallback  secondOneTap,
}) {
  return Column(
    children: [
      Text(headingText, style: Theme.of(context).textTheme.headlineSmall),
      SizedBox(height: 20.h),

      CustomSelectionContainer(
        onTap: firstOneTap,
        bodyText: firstBodyText,
        isSelected: isFirstOneActive,
        leadingSvgIconPath: firstLeadingIconPath,
      ),
      if(firstBodyText == "Instant Service")
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(height: 8.h,),
                Text("If you want instant service you have to pay \$10",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary),)
              ],
            ),
          ),
        ),

      SizedBox(height: 12.h),

      CustomSelectionContainer(
        onTap: secondOneTap,
        bodyText: secondBodyText,
        isSelected: !isFirstOneActive,
        leadingSvgIconPath: secondLeadingIconPath,
      ),
    ],
  );
}